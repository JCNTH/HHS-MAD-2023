//
//  CalendarPageViewModel.swift
//  HHS MAD 2023
//
//  Created by Aadit on 6/21/23.
//

import Foundation
import Firebase
import FirebaseStorage

struct Event : Identifiable, Decodable, Hashable {
    public var id = UUID();
    public var name : String;
    public var location : String;
    public var date : Date;
    public var repeatDay : String;
    public var details : String;
    public var type : String;
    
    public func describe() -> String {
        return name + " at " + location + " on " + date.formatted();
    }
    
}

class CalendarPageViewModel : ObservableObject{
    

    init () {
        fetchCurrentWeek()
        fetchEvents()
        fetchEventsForWeek()
        eventsForTodaysWeek = eventsForWeek;
    }
    
    @Published var todaysWeek : [Date] = [];
    @Published var eventsForTodaysWeek: [[Event]] = [[], [], [], [], [], [], []];
    
    @Published var currentWeek : [Date] = [];
    @Published var eventsForWeek: [[Event]] = [[], [], [], [], [], [], []];
    @Published var events: [Event] = [];
    
    @Published var activeEventID: String = "";
    
    func fetchEvents() {
        let db = Firestore.firestore();

        let ref = db.collection("events")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print (error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let name = data["name"] as? String ?? ""
                    let location = data["location"] as? String ?? ""
                    let date = (data["date"] as? Timestamp)?.dateValue() ?? Date()
                    let description = data["description"] as? String ?? ""
                    let repeatDay = data["repeat"] as? String ?? ""
                    let type = data["type"] as? String ?? ""

                    
                    let event = Event(name: name, location: location, date: date, repeatDay: repeatDay, details: description, type: type);
                    self.events.append(event);
                }
            }
        }
    }
    
    
    func fetchEventsForDate(day : Int) -> [Event] {
        var foundEvents : [Event] = [];
        events.forEach { event in
            if (event.repeatDay != "none") {
                if (event.repeatDay == currentWeek[day].formatted(Date.FormatStyle().weekday(.wide))) {
                    foundEvents.append(event);
                }
            } else {
                if (CalendarPageViewModel.isMatching(date1: currentWeek[day], date2: event.date)) {
                    foundEvents.append(event);
                }
            }

        }
        eventsForWeek[day] = foundEvents
        return foundEvents;
    }
    
    func fetchEventsForWeek() {
        (0...6).forEach { day in
            let dayEvents = fetchEventsForDate(day: day)
            eventsForWeek[day] = dayEvents
        }
    }
    
    func fetchCurrentWeek() {
        let today = Date();
        let calendar = Calendar.current;
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today);
        
        guard let firstWeekDay = week?.start else {
            return
        }
        
        (0...6).forEach { day in
            if let weekDay = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekDay);
                todaysWeek.append(weekDay);
            }
            
        }
    }
    
    func shift(shift: Int, unit: Calendar.Component) {
        let calendar = Calendar.current;
        
        (0...6).forEach { index in
            if let newDay = calendar.date(byAdding: unit, value: shift, to: currentWeek[index]) {
                currentWeek[index] = newDay;
            }
        }
        fetchEventsForWeek()
        if (currentWeek == todaysWeek) {
            eventsForTodaysWeek = eventsForWeek;
        }
        print(currentWeek[0].formatted());
    }
   
    func getCurrentMonth() -> String {
        return currentWeek[0].formatted(Date.FormatStyle().month(.wide));
    }
    
    func getTodaysMonth() -> String {
        return todaysWeek[0].formatted(Date.FormatStyle().month(.wide));
    }
    
    func getActiveEvent() -> Event {
        var activeEvent = events[0];
        events.forEach { event in
            if (event.id.uuidString.elementsEqual(activeEventID)) {
                activeEvent = event;
            }
        }
        return activeEvent;
    }
    
    
    static func isMatching(date1: Date, date2: Date) -> Bool {
        return date1.formatted(date: .complete, time: .omitted) == date2.formatted(date: .complete, time: .omitted);
    }
    
    
    static func formatDate(date: Date) -> String {
        return date.formatted(Date.FormatStyle().day(.twoDigits).weekday(.abbreviated))
    }
    
    

}

