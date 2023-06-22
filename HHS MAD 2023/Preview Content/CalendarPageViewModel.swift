//
//  CalendarPageViewModel.swift
//  HHS MAD 2023
//
//  Created by Aadit on 6/21/23.
//

import Foundation

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
    
    @Published var currentWeek : [Date] = [];
    @Published var events: [Event] = [];
    
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
    
    static func formatDate(date: Date) -> String {
        return date.formatted(Date.FormatStyle().day(.twoDigits).weekday(.abbreviated))
    }
    
    func getCurrentMonth() -> String {
        return currentWeek[0].formatted(Date.FormatStyle().month(.wide));
    }
    

}

