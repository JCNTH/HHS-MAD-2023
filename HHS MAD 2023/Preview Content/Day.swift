//
//  Day.swift
//  HHS MAD 2023
//
//  Created by Aaditya Raj on 2/23/23.
//

import SwiftUI

struct Day: View {
    @State var day: Int
    @State var today = Date().formatted(date: .complete, time: .omitted);
    @State var events:Array<String>
    @Binding var activeEvent: String
    @EnvironmentObject var calendarVM : CalendarPageViewModel


    var body: some View {
        let date = calendarVM.currentWeek[day];
        let formattedDate = date.formatted(date: .complete, time: .omitted);
        VStack(spacing: 0){
            HStack{
                Text(date.formatted(Date.FormatStyle().day(.twoDigits).weekday(.abbreviated)))
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(formattedDate == today ? Color.white : Color.black)
                .padding([.top, .leading, .trailing])
                
                Spacer()
            }
            RoundedRectangle(cornerRadius: 3)
                .frame(height: 5.0)
                .foregroundColor(formattedDate == today ? Color.white : Color(red: 85/255, green: 172/255, blue: 85/255))
                .scaleEffect(0.9)
            VStack(){
                ForEach(events, id: \.self) { event in
                    HStack {
                        Spacer()
                        Button {
                            activeEvent = event
                        } label: {
                            Text(event)
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                                .foregroundColor(formattedDate == today ? Color.white : Color.black)
                                
                        }
                        .padding(1.0)
                    }
                }
                .offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                
                
//                HStack {
//                    Spacer()
//                    Button {
//                        activeEvent = events[0]
//                    } label: {
//                        Text("CAASPP")
//                            .font(.system(size: 20, weight: .medium, design: .rounded))
//                            .foregroundColor(Color(red: 85/255, green: 172/255, blue: 85/255))
//                    }
//                    .padding(5.0)
//                }
//                HStack {
//                    Spacer()
//                    Button("hello") {
//                        print("hello")
//                    }
//                    .padding(5.0)
//                }.background(Color(hue: 0.335, saturation: 0.378, brightness: 0.681))
            }.padding([.leading, .bottom, .trailing], 20.0).background(formattedDate == today ? Color(red: 85/255, green: 172/255, blue: 85/255) : Color.white)
        }.background(formattedDate == today ? Color(red: 85/255, green: 172/255, blue: 85/255) : Color.white )
        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
        .shadow(color:.gray, radius: 8, x:4, y:4)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: formattedDate == today ? 0 : /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
        
        
    }
}





struct DayWrapper : View {
    @State var activeEvent = "none";
    var body: some View {
        Day(day:0, events:["Bike for Boba", "Robotics Workshops"], activeEvent:$activeEvent).environmentObject(CalendarPageViewModel())
    }
}

struct Day_Previews : PreviewProvider {
    static var previews: some View {
        DayWrapper();
    }
}

