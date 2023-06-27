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
    @Binding var discussionPage:Bool;
    @State var message = "";
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    @State var beenPressedDown = false;
    @State var beenPressedUp = false;
    
    
    var body: some View {
        if (discussionPage){
            
            VStack{
                Text(postName)
                    .padding()
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: 0, y: 70)
                
                Image (image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 4))
                    .frame(width: width-width/10, height: 300)
                    .offset(x:0, y:0)
                
                
                
                
                ScrollView{
                    
                    VStack {
                        HStack {
                            // Custom text field created below
                            TextField("Enter your message here", text: $message)
                //                .frame(height: 52)
                //                .disableAutocorrection(true)
                                .offset(x:10, y:0)

                            Button {
                               
                            } label: {
                                Image(systemName: "paperplane.fill")
                                    .foregroundColor(.white)
                                    .background(Color.green)
                                    .cornerRadius(50)
                                    .offset(x:-7, y:0)
                                    .scaleEffect(1)
                            }
                        }
                        .frame(width:width-20, height: height/20)
                        .background(Color("Gray"))
                        .cornerRadius(50)
                        .offset(x:0, y:5)
                        
                        HStack (spacing: 12){
                            Image("DefaultProfile")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .offset(x:0, y:0)
                            
                            Text("You messed up on simplifying the expression in the fourth line, I suggest reviewing the solution on CalcChat to assist you in completing this problem." )
                                .padding()
                                .font(.system(size: 17, design: .rounded))
                        }.offset(x: 10, y: 0)
                        
                        HStack (spacing: 12){
                            Image("DefaultProfile")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .offset(x:0, y:0)
                            
                            Text("We did a similar problem in the notes in chapter 4, section 3, you can look at how we solved it then, and apply the same concepts to solve it now. ")
                                .padding()
                                .font(.system(size: 17, design: .rounded))
                        }.offset(x: 10, y: 0)
                        
                        HStack (spacing: 12){
                            Image("DefaultProfile")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .offset(x:0, y:0)
                                
                            Text("I think that you messed up on a couple of simplifications; this is probably because you skipped over steps when solving your work, I suggest you make sure to right out every step to ensure that you don't make any mistakes.")
                                .padding()
                                .font(.system(size: 17, design: .rounded))
                        }.offset(x: 10, y: 0)
                            
                        HStack (spacing: 12){
                            Image("DefaultProfile")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .offset(x:0, y:0)
                            
                            Text("This concept is covered in chapter 4, section 3, just review the notes for that section and then possibly check calcchat.")
                                .padding()
                                .font(.system(size: 17, design: .rounded))
                        } .offset(x: 10, y: 0)
                            
                            HStack (spacing: 12){
                                Image("DefaultProfile")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .offset(x:0, y:0)
                                
                                Text("You messed up your work in line 5.")
                                    .padding()
                                    .font(.system(size: 17, design: .rounded))
                            }.offset(x: 10, y: 0)
                        
                        HStack (spacing: 12){
                            Image("DefaultProfile")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .offset(x:0, y:0)
                            
                            Text("You should review 2-3, it has similar concepts to that in the problem.")
                                .padding()
                                .font(.system(size: 17, design: .rounded))
                        }.offset(x: 10, y: 0)
                    }
                    
                    
                }.offset(x:0, y:-50)
                
               
            } .offset(x:0, y:-90)
            
            
            

            
           
        } else {
            Button(action: {
                discussionPage = true
            }) {
                VStack {
                    VStack(spacing: 2) {
                        Text(postName)
                            .padding()
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                            .offset(x: 0, y:10)
                        
                        Image (image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .frame(width: 280, height: 140)
                            .offset(x:0, y:0)
                            .shadow(color:.gray, radius: 8, x:4, y:4)
                        
                        HStack(spacing:1){
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
                                    .frame(width:30, height:30)
                            }
                            
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
                                    .frame(width:30, height:30)
                            }.shadow(color:.gray, radius: 8, x:4, y:4)
                        }.offset(x:0, y:-8)
                    }.cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    .frame(width: 320.0, height: 220.0)
                        .background(.white)
                    
                    
                    Divider()
                        .frame(width: width, height:1)
                        .background(Color.gray)
                        .opacity(0.5)
                }.offset(x:0, y:-10)
               
                
            }
        }
    }
    
}

struct ForumPost_1: View {
    @State var postName:String;
    @State var votes:Int;
    @State var postBody:String;
    @State var image1:Image;
    @State var discussionPage:Bool;
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    @State var beenPressedDown = false;
    @State var beenPressedUp = false;
    
    var body: some View {
        if (discussionPage){
            Color(red: 255/255, green: 255/255, blue: 231/255)
                .ignoresSafeArea()
            
            Text(postName)
                .padding()
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .offset(x: 0, y: -355)
            
            image1
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 4))
                .frame(width: width-width/10, height: 300)
                .offset(x:0, y:-220)
            
            ScrollView{
                VStack {
                    HStack (spacing: 12){
                        Image("DefaultProfile")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .offset(x:0, y:0)
                        
                        Text("You messed up on simplifying the expression in the fourth line, I suggest reviewing the solution on CalcChat to assist you in completing this problem." )
                            .padding()
                            .font(.system(size: 17, design: .rounded))
                    }.offset(x: 10, y: 0)
                    
                    HStack (spacing: 12){
                        Image("DefaultProfile")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .offset(x:0, y:0)
                        
                        Text("We did a similar problem in the notes in chapter 4, section 3, you can look at how we solved it then, and apply the same concepts to solve it now. ")
                            .padding()
                            .font(.system(size: 17, design: .rounded))
                    }.offset(x: 10, y: 0)
                    
                    HStack (spacing: 12){
                        Image("DefaultProfile")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .offset(x:0, y:0)
                            
                        Text("I think that you messed up on a couple of simplifications; this is probably because you skipped over steps when solving your work, I suggest you make sure to right out every step to ensure that you don't make any mistakes.")
                            .padding()
                            .font(.system(size: 17, design: .rounded))
                    }.offset(x: 10, y: 0)
                        
                    HStack (spacing: 12){
                        Image("DefaultProfile")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .offset(x:0, y:0)
                        
                        Text("This concept is covered in chapter 4, section 3, just review the notes for that section and then possibly check calcchat.")
                            .padding()
                            .font(.system(size: 17, design: .rounded))
                    } .offset(x: 10, y: 0)
                        
                        HStack (spacing: 12){
                            Image("DefaultProfile")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .offset(x:0, y:0)
                            
                            Text("You messed up your work in line 5.")
                                .padding()
                                .font(.system(size: 17, design: .rounded))
                        }.offset(x: 10, y: 0)
                    
                    HStack (spacing: 12){
                        Image("DefaultProfile")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .offset(x:0, y:0)
                        
                        Text("You should review 2-3, it has similar concepts to that in the problem.")
                            .padding()
                            .font(.system(size: 17, design: .rounded))
                    }.offset(x: 10, y: 0)
                }
                
                
            } .offset(x:0, y:height/2 - height/15)
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
                        image1
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
