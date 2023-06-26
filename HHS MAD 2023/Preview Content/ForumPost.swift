//
//  ForumPost.swift
//  HHS MAD 2023
//
//  Created by Bhruv Dhargava on 6/24/23.
//

import SwiftUI

struct ForumPost: View {
    @State var postName:String;
    @State var votes:Int;
    @State var postBody:String;
    @State var image:String;
    @State var discussionPage:Bool;
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    @State var beenPressedDown = false;
    @State var beenPressedUp = false;
    
    var body: some View {
        if (discussionPage){
            
        } else {
            Button(action: {
                discussionPage = true
            }) {
                ZStack {
                    Rectangle()
                        .offset(x: 0, y: 0)
                        .frame(width: 360, height: 110)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 2) {
                        Image (image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .frame(width: 150, height: 120)
                            .offset(x:10, y:0)
                        
                        VStack(spacing:1){
                            Text(postName)
                                .padding()
                                .font(.system(size: 14, weight: .bold, design: .rounded))
                                .foregroundColor(.black)
                                .offset(x: -40, y:10)
                            
                            HStack(spacing:10){
                                ScrollView(){
                                    Text(postBody)
                                        .padding()
                                        .font(.system(size: 13, design: .rounded))
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.leading)
                                        .offset(x:5, y:10)
                                }
                                
                                VStack(){
                                    Button(action: {
                                        if (!beenPressedUp){
                                            votes += 1
                                            beenPressedUp = true
                                            beenPressedDown = false
                                        }
                                    }) {
                                        Image("up")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width:20, height:20)
                                    }.offset(x:0, y:20)
                                    
                                    Text(String(votes))
                                        .padding()
                                        .font(.system(size: 18, design: .rounded))
                                        .bold()
                                        .foregroundColor(.black)
                                    
                                    Button(action: {
                                        if (!beenPressedDown){
                                            votes -= 1
                                            beenPressedUp = false
                                            beenPressedDown = true
                                        }
                                    }) {
                                        Image("down")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width:20, height:20)
                                    }.offset(x:0, y:-20)
                                        
                                }.offset(x:-29, y:0)
                            }.offset(x:0, y:-30)
                        }
                    }.offset(x:20, y:0)
                }
                .shadow(color:.gray, radius: 8, x:4, y:4)
            }
        }
    }
    
}
