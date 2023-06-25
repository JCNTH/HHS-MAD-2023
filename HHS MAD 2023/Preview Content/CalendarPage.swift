//
//  CalendarUI.swift
//  HHS MAD 2023
//
//  Created by Julian NTH on 2/7/23.
//

import SwiftUI

struct CalendarPage: View {
    
    @EnvironmentObject var calendarVM : CalendarPageViewModel;
  
    var body: some View {
       
        VStack {
//            List(calendarVM.events) { event in
//                Text(event.describe())
//            }
            // Introductory Section
            HStack {
                Text("Calendar")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(Color.green)
                    .multilineTextAlignment(.leading)
                    .padding()
                Spacer()
                HStack {
                    Button {
                        calendarVM.shift(shift:-1, unit: .month);
                    } label: {
                        Image(systemName: "arrowtriangle.backward.fill")
                            .foregroundColor(Color.gray)
                    }
                    Text(calendarVM.getCurrentMonth())
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(/*@START_MENU_TOKEN@*/.all, 12.0/*@END_MENU_TOKEN@*/)
                        .background(Capsule().foregroundColor(Color(red: 85/255, green: 172/255, blue: 85/255)))
                    Button {
                        calendarVM.shift(shift:1, unit: .month);
                    } label: {
                        Image(systemName: "arrowtriangle.forward.fill")
                            .foregroundColor(Color.gray)
                    }
                }
            }
            .padding(.top, 50.0)
           
            HStack(spacing: 0) {
                Button {
                    calendarVM.shift(shift:-7, unit: .day);
                } label : {
                    Image(systemName: "arrowtriangle.backward.fill")
                        .foregroundColor(Color.gray)
                }
                ScrollView{
                    VStack{
                        ForEach((0...6), id: \.self) { day in
                            let events = calendarVM.fetchEventsForDate(day: day);
                            Day(day: day, events: events).environmentObject(calendarVM);
                        }

//                        Day(date:calendarVM.currentWeek[0], events:["Robotics Workshops", "FBLA Panda Express Fundraiser"], activeEvent:$activeEvent)
//                            Day(date:calendarVM.currentWeek[1], events:["Varsity BBall Game @ MV"], activeEvent:$activeEvent)
//                            Day(date:calendarVM.currentWeek[2], events:["Robotics Workshops"], activeEvent:$activeEvent)
//                            Day(date:calendarVM.currentWeek[3], events:["Senior Sunrise"], activeEvent:$activeEvent)
//                            Day(date:calendarVM.currentWeek[4], events:["Bike for Boba", "Robotics Workshops"], activeEvent:$activeEvent)
//                            Day(date: calendarVM.currentWeek[5], events:["Multicultural Night"], activeEvent:$activeEvent)
//                            Day(date:calendarVM.currentWeek[6], events:[""], activeEvent:$activeEvent)
    //                    }
    //                    else {
    //                        Day(date:"Sun " + String(23 + dayShift), events:["Robotics Workshops", "Quiz Bowl MOD Fundraiser"], activeEvent:$activeEvent)
    //                        Day(date:"Mon " + String(23 + dayShift + 1), events:["JV Badminton @ BCP"], activeEvent:$activeEvent)
    //                        Day(date:"Tues " + String(23 + dayShift + 2), events:["Robotics Workshops"], activeEvent:$activeEvent)
    //                        Day(date:"Wed " + String(23 + dayShift + 3), events:[""], activeEvent:$activeEvent)
    //                        Day(date:"Thurs " + String(23 + dayShift + 4), events:["Robotics Workshops"], activeEvent:$activeEvent)
    //                        Day(date:"Fri " + String(23 + dayShift + 5), events:["Mustang Homecoming"], activeEvent:$activeEvent)
    //                        Day(date:"Sat " + String(23 + dayShift + 6), events:[""], activeEvent:$activeEvent)
    //                    }
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
                
                Button {
                    calendarVM.shift(shift:7, unit: .day);
                } label : {
                    Image(systemName: "arrowtriangle.forward.fill")
                        .foregroundColor(Color.gray)
                }

            }
            
        }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).background(Color(red: 231/255, green: 255/255, blue: 231/255)
            .ignoresSafeArea())
            
    }
    }

struct CalendarWrapper : View {
//    @State var activeEvent = Event(name: "Bike for Boba", location: "Your mom's house", date: Date(), details: "Let's bike!")
    var body: some View {
        CalendarPage().environmentObject(CalendarPageViewModel());
    }
}

struct CalendarPage_Previews : PreviewProvider {
    static var previews: some View {
        CalendarWrapper();
    }
}


    
    

