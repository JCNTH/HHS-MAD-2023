//
//  CalendarUI.swift
//  HHS MAD 2023
//
//  Created by Julian NTH on 2/7/23.
//

import SwiftUI

struct CalendarPage: View {
    var activeEvent: String;
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                HStack {
                    Image(systemName: "arrow.left")
                    Image(systemName: "arrow.right")
                }
            }
            ZStack {
                Group {
                    //Background color
                    Color(red: 231/255, green: 255/255, blue: 231/255)
                        .ignoresSafeArea()
                    
                    // Top section
                    
                    // Introductory Section
                    Text("Calendar")
                        .padding()
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .offset(x: -85, y: -365)
                    
                    
                    
                    
                    VStack{
//                        Day(date:"Mon 13", events:[], activeEvent: $activeEvent)
//                        Day(date:"Tues 14", events:[], activeEvent: $activeEvent)
//                        Day(date:"Wed 15", events:[], activeEvent: $activeEvent)
//                        Day(date:"Thurs 16", events:[], activeEvent: $activeEvent)
//                        Day(date:"Fri 17", events:[], activeEvent: $activeEvent)
//                        Day(date:"Sat 18", events:[], activeEvent: $activeEvent)
//                        Day(date:"Sun 19", events:[], activeEvent: $activeEvent)
                        Day(date:"Mon 13", events:[], activeEvent:activeEvent)
                        Day(date:"Tues 14", events:[], activeEvent:activeEvent)
                        Day(date:"Wed 15", events:[], activeEvent:activeEvent)
                        Day(date:"Thurs 16", events:[], activeEvent:activeEvent)
                        Day(date:"Fri 17", events:[], activeEvent:activeEvent)
                        Day(date:"Sat 18", events:[], activeEvent:activeEvent)
                        Day(date:"Sun 19", events:[], activeEvent:activeEvent)
                        }.scaleEffect(x:0.8, y:0.8)

                    }
                }
            }
            
        }
    }
    
    
    struct Calendar_Preview: PreviewProvider {
        static var previews: some View {
            let random = "CAASPP";
            CalendarPage(activeEvent:random)
        }
    }

