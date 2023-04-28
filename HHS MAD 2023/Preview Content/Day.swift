//
//  Day.swift
//  HHS MAD 2023
//
//  Created by Aaditya Raj on 2/23/23.
//

import SwiftUI

struct Day: View {
    var date: String
    var events:Array<String>
    @Binding var activeEvent: String


    var body: some View {
        VStack{
            HStack{
                Text(date)
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .foregroundColor(Color(red: 85/255, green: 172/255, blue: 85/255))
                .padding([.top, .leading])
                Spacer()
            }
            VStack(){
                ForEach(events, id: \.self) { event in
                    HStack {
                        Spacer()
                        Button {
                            activeEvent = event
                        } label: {
                            Text(event)
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                                .foregroundColor(Color(red: 85/255, green: 172/255, blue: 85/255))
                        }
                        .padding(1.0)
                    }
                }
                
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
            }.padding([.leading, .bottom, .trailing], 20.0).background(Color(hue: 0.335, saturation: 0.189, brightness: 0.897))
        }.background(Color(hue: 0.335, saturation: 0.35, brightness: 0.83))
        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
        .shadow(color:.gray, radius: 8, x:4, y:4).fontDesign(.serif)
    }
}


//struct Day_Preview: PreviewProvider {
//    static var previews: some View {
//        let random = "CAASPP";
//        Day(date:"Mon 13", events:[], activeEvent:"Baseball Game")
//    }
//}
