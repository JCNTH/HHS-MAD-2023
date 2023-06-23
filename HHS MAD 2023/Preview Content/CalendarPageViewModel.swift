//
//  CalendarPageViewModel.swift
//  HHS MAD 2023
//
//  Created by Aadit on 6/21/23.
//

import Foundation
import Firebase

class Event : Identifiable, Decodable {
    var id = UUID();
    var name : String;
    var location : String;
    var date : Date;
    var description : String;
}

class CalendarPageViewModel : ObservableObject{
    
    init () {
        fetchCurrentWeek()
    }
    
    var todaysWeek : [Date] = [];
    @Published var currentWeek : [Date] = [];
    @Published var events: [Event] = [];
    
    func fetchEvents() {
//        let db = Firestore.firestore();
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
    
    static func isToday(date: Date) -> Bool {
        return date.formatted(date: .complete, time: .omitted) == Date().formatted(date: .complete, time: .omitted);
    }
    
    static func formatDate(date: Date) -> String {
        return date.formatted(Date.FormatStyle().day(.twoDigits).weekday(.abbreviated))
    }
    
    

}

