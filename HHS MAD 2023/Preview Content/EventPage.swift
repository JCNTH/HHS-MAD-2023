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
    var headerImage:String;
    var images:[String];
    @Binding var activeEvent:String
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    activeEvent = "none";
                }) {
                    Image(systemName: "arrow.backward")
                        .padding(.leading).scaleEffect(2)
                }
                Spacer()
            }
            Text(eventName)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .fontWeight(.heavy)
                .padding(.bottom, -10.0)
            
            VStack{
                Image (headerImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(40)
                HStack {
                    Text("Time:")
                        .bold()
                    Spacer()
                    Text(time)
                        .italic()
                }.padding().background(Color(red: 231/255, green: 255/255, blue: 231/255)).cornerRadius(50)
                HStack {
                    Text("Date:")
                        .bold()
                    Spacer()
                    Text(date)
                        .italic()
                }.padding().background(Color(red: 231/255, green: 255/255, blue: 231/255)).cornerRadius(50)
                HStack {
                    Text("Location:")
                        .bold()
                    Spacer()
                    Text(location)
                        .italic()
                }.padding().background(Color(red: 231/255, green: 255/255, blue: 231/255)).cornerRadius(50)
                HStack(alignment: .top) {
                    Text("Description:")
                        .bold()
                    Spacer()
                    Text(description)
                        .italic()
                }.padding().background(Color(red: 231/255, green: 255/255, blue: 231/255)).cornerRadius(50)
                HStack {
                    Image(systemName: "arrowtriangle.left.fill")
                    Image (images[0])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    Image (images[1])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    Image(systemName: "arrowtriangle.right.fill")
                    
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
            
        }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).background(Color(hue: 0.335, saturation: 0.189, brightness: 0.897))
    }
}
