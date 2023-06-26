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
                        let _ = print(calendarVM.eventsForTodaysWeek);
                        ForEach((0...6), id: \.self) { day in
                            Day(day: day).environmentObject(calendarVM);
                        }
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


    
    

