//
//  CalendarUI.swift
//  HHS MAD 2023
//
//  Created by Julian NTH on 2/7/23.
//

import SwiftUI
import Foundation
import UIKit

struct CalendarUI: View {
    @EnvironmentObject var calendarVM : CalendarPageViewModel;
    @State var numDates: Int
    @State var button1 = true
    @State var button2 = false
    @State var button3 = false
    @State var button4 = false
    @State var button5 = false
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    let inactive = Color.black
    
    @State var day = ["Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"]
    
    
    let active = Color(red: 85/255, green: 172/255, blue: 85/255)
    
    @State var fromDate = 0
    
    var body: some View {   
        VStack{
//            Text("Upcoming Events")
//                .font(.system(size: 40, weight: .bold, design: .rounded))
//                .foregroundColor(Color(red: 36/255, green: 120/255, blue: 36/255))
            Text(calendarVM.getTodaysMonth() + " " + String(Int(getDay(day: fromDate))))
                .foregroundColor(Color(red: 85/255, green: 172/255, blue: 85/255))
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .offset(x:0, y:-30)
            
            HStack(alignment: .center, spacing: width/20){
                Button{
                    fromDate = 0
                    button1 = true
                    button2 = false
                    button3 = false
                    button4 = false
                    button5 = false
                } label: {
                    ZStack{
                        Image(systemName: "rectangle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(button1 ? active:inactive)
                            .shadow(radius: button1 ? 5:0)
                        VStack{
                            Text(String(Int(getDay(day:0))))
                                .foregroundColor(Color.white)
                            
                            Text(day[2])
                                .foregroundColor(Color.white)
                        }
                        
                    }
                }
                
                Button{
                    fromDate = 1
                    button1 = false
                    button2 = true
                    button3 = false
                    button4 = false
                    button5 = false
                } label: {
                    ZStack{
                        Image(systemName: "rectangle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(button2 ? active:inactive)
                            .shadow(radius: button2 ? 5:0)
                        VStack{
                            Text(String(Int(getDay(day:1))))
                                .foregroundColor(Color.white)
                            
                            Text(day[3])
                                .foregroundColor(Color.white)
                        }
                        
                    }
                }
                
                Button{
                    fromDate = 2
                    button1 = false
                    button2 = false
                    button3 = true
                    button4 = false
                    button5 = false
                } label: {
                    ZStack{
                        Image(systemName: "rectangle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(button3 ? active:inactive)
                            .shadow(radius: button3 ? 5:0)
                        VStack{
                            Text(String(Int(getDay(day:2))))
                                .foregroundColor(Color.white)
                            
                            Text(day[4])
                                .foregroundColor(Color.white)
                        }
                        
                    }
                }
                
                Button{
                    fromDate = 3
                    button1 = false
                    button2 = false
                    button3 = false
                    button4 = true
                    button5 = false
                } label: {
                    ZStack{
                        Image(systemName: "rectangle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(button4 ? active:inactive)
                            .shadow(radius: button4 ? 5:0)
                        VStack{
                            Text(String(Int(getDay(day:3))))
                                .foregroundColor(Color.white)
                            
                            Text(day[5])
                                .foregroundColor(Color.white)
                        }
                        
                    }
                }
                
                Button{
                    fromDate = 4
                    button1 = false
                    button2 = false
                    button3 = false
                    button4 = false
                    button5 = true
                } label: {
                    
                    ZStack{
                        Image(systemName: "rectangle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(button5 ? active:inactive)
                            .shadow(radius: button5 ? 5:0)
                        VStack{
                            Text(String(Int(getDay(day:4))))
                                .foregroundColor(Color.white)
                            
                            Text(day[6])
                                .foregroundColor(Color.white)
                        }
                        
                    }
                }
            }.frame(width: width, height: height/12)
                .offset(x:0, y:-45)
                
            
            VStack{
               
                
                if (calendarVM.eventsForTodaysWeek[fromDate].count == 0) {
                    HStack(spacing: 20){
                        VStack(alignment: .leading){
                            Text("No events for this day!")
                                .font(.title).bold()
                        }.frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding()
                } else {
                    ForEach(calendarVM.eventsForTodaysWeek[fromDate], id:\.self) { event in
                        Button{
                            calendarVM.activeEventID = event.id.uuidString;
                        } label: {
                            HStack(spacing: 20){
                                VStack(alignment: .leading){
                                    Text(event.name)
                                        .font(.title).bold()
                                }.frame(maxWidth: .infinity, alignment: .leading)
                                
                                Image(systemName: "timer")
                                    .foregroundColor(.gray)
                                    .padding(10)
                                    .background(.white)
                                    .cornerRadius(50)
                            }
                            .padding()
                        }
                    }
                }
            }
            .background(RoundedRectangle( cornerRadius: 13, style: .continuous).foregroundColor((Color(red: 255/255, green: 255/255, blue: 255/255))))
           
               
        }
        
    }
    
    func getDay(day : Int) -> Int {
        let day: Int = Int(calendarVM.todaysWeek[day].formatted(Date.FormatStyle().day(.twoDigits))) ?? 0;
        return day;
    }
}

struct CalendarUI_Previews: PreviewProvider {
    static var previews: some View {
        CalendarUI(numDates: 5).environmentObject(CalendarPageViewModel())
    }
}



//func getDay(days: Int) -> DateComponents
//{
//    // Get right now as it's `DateComponents`.
//
//    let now = Calendar.current.dateComponents(in: .current, from: Date())
//
//
//
//    // Create the start of the day in `DateComponents` by leaving off the time.
//    let today = DateComponents(year: now.year, month: now.month, day: now.day! + days)
//    let dateToday = Calendar.current.date(from: today)!
//    print(dateToday.timeIntervalSince1970)
//
//    // Add 1 to the day to get tomorrow.
//    // Don't worry about month and year wraps, the API handles that.
//    let tomorrow = DateComponents(year: now.year, month: now.month, day: now.day! + 1)
////    let dateTomorrow = Calendar.current.date(from: tomorrow)!
//
//
//
//    return today
//}



//extension Date {
//    static var yesterday: Date { return Date().dayBefore }
//    static var tomorrow:  Date { return Date().dayAfter }
//    var dayBefore: Date {
//        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
//    }
//    var dayAfter: Date {
//        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
//    }
//    var dayAfter2: Date {
//        return Calendar.current.date(byAdding: .day, value: 2, to: noon)!
//    }
//    var dayAfter3: Date {
//        return Calendar.current.date(byAdding: .day, value: 3, to: noon)!
//    }
//    var dayAfter4: Date {
//        return Calendar.current.date(byAdding: .day, value: 4, to: noon)!
//    }
//    var noon: Date {
//        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
//    }
//    var month: Int {
//        return Calendar.current.component(.month,  from: self)
//    }
//    var isLastDayOfMonth: Bool {
//        return dayAfter.month != month
//    }
//}
