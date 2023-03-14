//
//  CalendarUI.swift
//  HHS MAD 2023
//
//  Created by Julian NTH on 2/7/23.
//

import SwiftUI

struct CalendarPage: View {
    var body: some View {
        ZStack {
            Group {
            //Background color
            Color(red: 231/255, green: 255/255, blue: 231/255)
                .ignoresSafeArea()
            
            // Top section
        
                // Introductory Section
                Group {
                    Text("Calendar")
                        .padding()
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .offset(x: -85, y: -365)
                }
                
              
        
                
            VStack{
                Day(date:"Mon 13", events:[])
                Day(date:"Tues 14", events:[])
                Day(date:"Wed 15", events:[])
                Day(date:"Thurs 16", events:[])
                Day(date:"Fri 17", events:[])
                Day(date:"Sat 18", events:[])
                Day(date:"Sun 19", events:[])
               
            }.scaleEffect(x:0.8, y:0.8)
                
            }
        }
    }
}

struct CalendarPage_Previews: PreviewProvider {
    static var previews: some View {
        CalendarPage()
    }
}


