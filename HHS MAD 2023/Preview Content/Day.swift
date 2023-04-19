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
    var activeEvent: String


    var body: some View {
        VStack{
            HStack{
                Text(date)
                .font(.title3)
                .foregroundColor(Color(red: 85/255, green: 172/255, blue: 85/255))
                .padding([.top, .leading])
                Spacer()
            }
            VStack(){
//                List(events, id: \.self) { event in
//                    HStack {
//                        Spacer()
//                        Text(event)
//                    }.frame(maxWidth:.infinity, maxHeight:.infinity).background(Color(hue: 0.335, saturation: 0.378, brightness: 0.681))
//                }.background(Color(hue: 0.335, saturation: 0.378, brightness: 0.681))
                
                HStack {
                    Spacer()
                    Button("CAASPP Testing") {
//                        activeEvent = "CAASPP";
                    }
                    .padding(5.0)
                }.background(Color(hue: 0.335, saturation: 0.378, brightness: 0.681))
//                HStack {
//                    Spacer()
//                    Button("hello") {
//                        print("hello")
//                    }
//                    .padding(5.0)
//                }.background(Color(hue: 0.335, saturation: 0.378, brightness: 0.681))
            }.padding([.leading, .bottom, .trailing], 20.0)
        }.background(Color(hue: 0.335, saturation: 0.495, brightness: 0.855))
        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
        .shadow(color:.gray, radius: 8, x:4, y:4).fontDesign(.serif)
    }
}


struct Day_Preview: PreviewProvider {
    static var previews: some View {
        let random = "CAASPP";
        Day(date:"Mon 13", events:[], activeEvent:"Baseball Game")
    }
}
