//
//  ForumnPage.swift
//  HHS MAD 2023
//
//  Created by Bhruv Dhargava on 6/22/23.
//

import SwiftUI

struct ForumPage: View {
    @State var subject:String;
    @State var menu:[String];
    @State var state:[Bool];
    @State var active:Bool;

    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    @State var state1 = true;
    @State var state2 = false;
    @State var state3 = false;
    @State var state4 = false;
    
    @State var photos = false
    @State var events = false
    @State var clubs = false
    @State var social = true
    
    //Text variables
    @State var Social = "Social"
    @State var Clubs = "Clubs"
    @State var Photos = "Photos"
    @State var Events = "Events"
    
    @State var SocialImage = "Math-Icon"
    @State var EventImage = "clock"
    @State var ClubImage = "person.2.fill"
    @State var PhotoImage = "camera"
    
    @State var discussionPage = false;
    
    var body: some View {
        if (discussionPage){
            
        } else if (active){
            //Top Section
            Color(red: 255/255, green: 255/255, blue: 255/255)
                .ignoresSafeArea()
            
            Group {
                //Header
                Group {
                    Text(subject)
                        .padding()
                        .font(.system(size: 30, weight: .bold, design:.rounded))
                        .offset(x: 0, y: -5*height/12 - 10)
                    
                    //Back button
                }
                
                //Activities Topic Selector
                HStack(spacing: 3){
                    Button_Forum(text: $menu[0], state: $state1, other1: $state2, other2: $state3, other3: $state4, image: $menu[0])
                    Button_Forum(text: $menu[1], state: $state2, other1: $state1, other2: $state3, other3: $state4, image: $menu[1])
                    Button_Forum(text: $menu[2], state: $state3, other1: $state1, other2: $state2, other3: $state4, image: $menu[2])
                    Button_Forum(text: $menu[3], state: $state4, other1: $state1, other2: $state2, other3: $state3, image: $menu[3])
                    
                }.offset(x:-5, y:50 + (-5*height/12))
                
                ScrollView(){
                    //Top Post
                    Button(action: {
                        discussionPage = true;
                    }) {
                        RoundedRectangle( cornerRadius: 13, style: .continuous)
                            .frame(width: 360, height: 120)
                            .offset(x: 0, y: -220)
                        
                        Image ("Homework")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .frame(width: 150, height: 120)
                            .offset(x:-94, y:-220)
                                            
                        Text("AP Calculus BC")
                            .padding()
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .offset(x: 50, y: -260)
                            .foregroundColor(.white)
                                                    
                                                    
                        Text("Need help on solving integral")
                            .padding()
                            .font(.system(size: 13, design: .rounded))
                            .offset(x: 80, y: -240)
                            .foregroundColor(.white)
                                                    
                        Text("↑ 5 ↓")
                            .padding()
                            .font(.system(size: 32, design: .rounded))
                            .offset(x: 30, y: -200)
                            .foregroundColor(.white)
                    }
                }.offset (x:100, y:400)
                
                //Back button
                Button(action: {
                    active = false;
                    
                }) {
                    Image(systemName: "arrow.backward")
                        .padding(.leading).scaleEffect(2)
                }.offset(x: -width/3 - 25, y: -5*height/12 - 15)
            }
            
        } else {
            HHS_MAD_2023.Academics()
        }
        
    }
}
