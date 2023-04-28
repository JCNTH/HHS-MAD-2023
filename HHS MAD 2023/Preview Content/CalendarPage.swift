//
//  CalendarUI.swift
//  HHS MAD 2023
//
//  Created by Julian NTH on 2/7/23.
//

import SwiftUI

struct CalendarPage: View {
    
    @Binding var activeEvent: String;
    @State var dayShift = 0;
  
    var body: some View {
       
        VStack {
            HStack {
                Spacer()
                HStack {
                    Button {
                        dayShift = dayShift - 7;
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                    Button {
                        dayShift = dayShift + 7;
                    } label: {
                        Image(systemName: "arrow.right")
                    }
                }
            }
            .padding(.top, 15.0)
            // Introductory Section
            HStack {
                Text("Calendar")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(Color.green)
                    .multilineTextAlignment(.leading)
                    .padding()
                Spacer();
            }
           
            ScrollView{
                VStack{
//                    var daysOfWeek = ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"]
//                    for i in 0...6 {
//                        Day(date:(daysOfWeek[i] + " " + 23 + dayShift, events:[""]), activeEvent:$activeEvent)
//                    }
                    Day(date:"Sun " + String(23 + dayShift), events:[""], activeEvent:$activeEvent)
                    Day(date:"Mon " + String(23 + dayShift + 1), events:["Varsity BBall Game @ MV"], activeEvent:$activeEvent)
                    Day(date:"Tues " + String(23 + dayShift + 2), events:["Robotics Workshops"], activeEvent:$activeEvent)
                    Day(date:"Wed " + String(23 + dayShift + 3), events:["Senior Sunrise"], activeEvent:$activeEvent)
                    Day(date:"Thurs " + String(23 + dayShift + 4), events:["Bike for Boba", "Robotics Workshops"], activeEvent:$activeEvent)
                    Day(date:"Fri " + String(23 + dayShift + 5), events:["Multicultural Night"], activeEvent:$activeEvent)
                    Day(date:"Sat " + String(23 + dayShift + 6), events:["Robotics Workshops", "FBLA Panda Express Fundraiser"], activeEvent:$activeEvent)
                }.padding(.vertical, -80.0).scaleEffect(x:0.8, y:0.8)
            }
            
        }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).background(Color(red: 231/255, green: 255/255, blue: 231/255)
            .ignoresSafeArea())
            
        }
    }
    
    

