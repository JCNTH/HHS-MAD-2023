//
//  CalendarPageViewModel.swift
//  HHS MAD 2023
//
//  Created by Aadit on 6/21/23.
//

import Foundation
import Firebase

struct Event : Identifiable, Decodable {
    var id = UUID();
    var name : String;
    var location : String;
    var date : Date;
    var details : String;
    
    public func describe() -> String {
        return name + " at " + location + " on " + date.formatted();
    }
    
    public func getName() -> String {
        return name;
    }
    
    
}

class CalendarPageViewModel : ObservableObject{
    

    init () {
        fetchCurrentWeek()
        fetchEvents()
    }
    
    var todaysWeek : [Date] = [];
    @Published var currentWeek : [Date] = [];
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


                    
                    let event = Event(name: name, location: location, date: date, details: description);
                    self.events.append(event);
                }
            }
        }
    }
    
    func fetchEventsForDate(day : Int) -> [Event] {
        var foundEvents : [Event] = [];
        events.forEach { event in
            if (CalendarPageViewModel.isMatching(date1: currentWeek[day], date2: event.date)) {
                foundEvents.append(event);
                print(event.getName());
            }
        }
        return foundEvents;
    }
    
    func fetchCurrentWeek() {
        let today = Date();
        let calendar = Calendar.current;
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today);
        
        guard let firstWeekDay = week?.start else {
            return
        }
        
        (1...7).forEach { day in
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
        print(currentWeek[0].formatted());
    }
   
    func getCurrentMonth() -> String {
        return currentWeek[0].formatted(Date.FormatStyle().month(.wide));
    }
    
    func getTodaysMonth() -> String {
        return todaysWeek[0].formatted(Date.FormatStyle().month(.wide));
    }
    
    static func isMatching(date1: Date, date2: Date) -> Bool {
        return date1.formatted(date: .complete, time: .omitted) == date2.formatted(date: .complete, time: .omitted);
    }
    
    static func formatDate(date: Date) -> String {
        return date.formatted(Date.FormatStyle().day(.twoDigits).weekday(.abbreviated))
    }
    
    

}

