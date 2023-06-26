//
//  Day.swift
//  HHS MAD 2023
//
//  Created by Aaditya Raj on 2/23/23.
//

import SwiftUI

struct Day: View {
    @State var day: Int
    @EnvironmentObject var calendarVM : CalendarPageViewModel


    var body: some View {
        let date = calendarVM.currentWeek[day];
        let events = calendarVM.eventsForWeek[day];
        let isToday = CalendarPageViewModel.isMatching(date1: date, date2: Date());
        VStack(spacing: 0){
            HStack{
                Text(date.formatted(Date.FormatStyle().day(.twoDigits).weekday(.abbreviated)))
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(isToday ? Color.white : Color.black)
                .padding([.top, .leading, .trailing])
                
                Spacer()
            }
            RoundedRectangle(cornerRadius: 3)
                .frame(height: 5.0)
                .foregroundColor(isToday ? Color.white : Color(red: 85/255, green: 172/255, blue: 85/255))
                .scaleEffect(0.9)
            VStack(){
                ForEach(events, id: \.self) { event in
                    HStack {
                        Spacer()
                        Button {
                            calendarVM.activeEventID = event.id.uuidString;
                        } label: {
                            Text(event.getName())
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                                .foregroundColor(isToday ? Color.white : Color.black)
                                
                        }
                        .padding(1.0)
                    }
                }
                .offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            }.padding([.leading, .bottom, .trailing], 20.0).background(isToday ? Color(red: 85/255, green: 172/255, blue: 85/255) : Color.white)
        }.background(isToday ? Color(red: 85/255, green: 172/255, blue: 85/255) : Color.white )
        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
        .shadow(color:.gray, radius: 8, x:4, y:4)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: isToday ? 0 : /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
        
        
    }
}





struct DayWrapper : View {
    var body: some View {
        Day(day:6).environmentObject(CalendarPageViewModel())
    }
}

struct Day_Previews : PreviewProvider {
    static var previews: some View {
        DayWrapper();
    }
}

