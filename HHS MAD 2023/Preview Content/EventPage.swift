//
//  EventPage.swift
//  HHS MAD 2023
//
//  Created by Aaditya Raj on 2/27/23.
//

import SwiftUI

struct EventPage: View {
    var eventName:String;
    var time:String;
    var date:String;
    var location:String;
    var description:String;
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text(eventName)
                .font(.title)
                .fontWeight(.heavy)
            VStack {
                Image ("Activity1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                HStack {
                    Text("Time:")
                        .bold()
                    Text(time)
                        .italic()
                }
                HStack {
                    Text("Date:")
                        .bold()
                    Text(date)
                        .italic()
                }
                HStack {
                    Text("Location:")
                        .bold()
                    Text(location)
                        .italic()
                }
                HStack {
                    Text("Description:")
                        .bold()
                    Text(description)
                        .italic()
                }
                HStack {
                    Image(systemName: "arrowtriangle.left.fill")
                    Image ("Activity1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    Image ("Activity1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    Image(systemName: "arrowtriangle.right.fill")

                }
            }
            .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
            .background(Color(hue: 0.339, saturation: 0.269, brightness: 0.934))
            
        }.background(.white)
    }
}

struct EventPage_Previews: PreviewProvider {
    static var previews: some View {
        EventPage(eventName:"Senior Sunrise", time:"7 AM", date:"1/1/23", location:"HHS Quad", description:"Come out to enjoy the sunrise!")
    }
}
