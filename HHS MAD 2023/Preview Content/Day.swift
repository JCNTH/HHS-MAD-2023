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
        VStack(spacing: 0){
            HStack{
                Text(date)
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                .foregroundColor(Color.black)
                .padding([.top, .leading, .trailing])
                Spacer()
            }
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/3.0/*@END_MENU_TOKEN@*/)
                .frame(height: 5.0)
                .foregroundColor(Color(red: 85/255, green: 172/255, blue: 85/255))
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
                                .foregroundColor(Color.black)
                                
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
            }.padding([.leading, .bottom, .trailing], 20.0).background(Color.white)
        }.background(Color.white)
        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
        .shadow(color:.gray, radius: 8, x:4, y:4)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
        
        
    }
}





struct DayWrapper : View {
    @State var activeEvent = "none";
    var body: some View {
        Day(date:"Mon 13", events:["Bike for Boba", "Robotics Workshops"], activeEvent:$activeEvent)
    }
}

struct Day_Previews : PreviewProvider {
    static var previews: some View {
        DayWrapper();
    }
}

