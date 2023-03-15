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
            
            HStack {
                Image(systemName: "arrow.backward")
                    .padding(.leading).scaleEffect(2)
                Spacer()
            }
            Text(eventName)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .fontWeight(.heavy)

            VStack {
                Image ("CAASPP")
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
                HStack(alignment: .top) {
                    Text("Description:")
                        .bold()
                    Text(description)
                        .italic()
                }
                HStack {
                    Image(systemName: "arrowtriangle.left.fill")
                    Image ("testTaking")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    Image ("testTaking2")
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
        EventPage(eventName:"CASSPP", time:"7 AM", date:"1/1/23", location:"L103", description:"Required for Juniors. Statewide testing to monitor high school learning progress.")
    }
}
