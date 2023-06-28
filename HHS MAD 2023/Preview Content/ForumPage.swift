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
    
    @State var discussionPage1 = false;
    @State var discussionPage2 = false;
    @State var discussionPage3 = false;
    
    @State var createNewPost = false;
    
    @State var active1 = false;
    
    @State var createdActivity = false
    var body: some View {
        if (active1){
            
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
                    VStack(spacing: 10){
                        
                        if (discussionPage1){
                            ForumPost(postName: "Solving Equation", votes: 45, postBody: "I thought that we needed to solve the integral like this perilous hard work and determination.", image: "Homework", discussionPage: $discussionPage1).padding(.top)
                        } else if (discussionPage2){
                            ForumPost(postName: "Simplifying", votes: 23, postBody: "I thought that we needed to solve the integral through perilous hard work and determination.", image: "Homework", discussionPage: $discussionPage2)
                        } else if (discussionPage3){
                            ForumPost(postName: "Solving Square", votes: 18, postBody: "I thought that we needed to solve the integral through perilous hard work and determination.", image: "Homework", discussionPage: $discussionPage3)
                        } else {
                            VStack(spacing: 10){
                                //Top Post
                                HStack {
                                    // Custom text field created below
                                    Text("Click Here To Post")
                        //                .frame(height: 52)
                        //                .disableAutocorrection(true)
                                        .offset(x:0, y:0)
                                        .foregroundColor(Color.black)

                                    Button {
                                       
                                    } label: {
                                        
                                    }
                                    
                                }.frame(width:width-20, height: height/20)
                                    .background(Color("Gray"))
                                    .cornerRadius(50)
                                    .offset(x:0, y:5)
                                
//                                Divider()
//                                    .frame(width: width, height:1)
//                                    .background(Color.gray)
//                                    .opacity(0.5)
                                
                                Divider()
                                
                                ForumPost(postName: "Solving Equation", votes: 45, postBody: "I thought that we needed to solve the integral like this perilous hard work and determination.", image: "Homework", discussionPage: $discussionPage1)
                                ForumPost(postName: "Simplifying", votes: 23, postBody: "I thought that we needed to solve the integral through perilous hard work and determination.", image: "Homework", discussionPage: $discussionPage2)
                                ForumPost(postName: "Solving Square", votes: 18, postBody: "I thought that we needed to solve the integral through perilous hard work and determination.", image: "Homework", discussionPage: $discussionPage3)
                            }
                        }
                    }
                }.offset(x:0, y:240)
                
                
                //Back button
                Button(action: {
                    active = false;
                    
                }) {
                    Image(systemName: "arrow.backward")
                        .padding(.leading).scaleEffect(2)
                        
                }.offset(x: -width/3 - 25, y: -5*height/12 - 15).frame(width: 20.0, height: 20.0)
                
                if (createNewPost){
                    //createForumPost(create: $createNewPost, createdNew: $createdActivity)
                }
            }
            
        } else {
            HHS_MAD_2023.Academics()
        }
        
    }
}

struct createForumPost: View {
    @Binding var create: Bool
    @Binding var createdNew: Bool
    
    @State var description = ""
    @State var name = ""
    @State var showImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    @ObservedObject var Activity: ActivityManager

    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.white)
                .frame(width: width/1.2, height: height/1.2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(radius: 10)
            
            ScrollView {
                VStack (spacing: 30){
                    Image(systemName: "cube.transparent.fill")
                        .resizable()
                        .frame(width: 150, height: 150)
                
                    Text("Activity Name")
                        .font(.largeTitle).bold()
                        .foregroundColor(Color.green)
                        .padding()
                
                    TextField("Fill in Text", text: $name)
                        .background(Rectangle().fill(Color.white).shadow(radius: 3).frame(width: width/1.2, height: height/15))
                        .foregroundColor(name.isEmpty ? Color.gray.opacity(0.3):Color.black)
                        .font(.headline)
                    
                    Text("Post Body")
                        .font(.largeTitle).bold()
                        .foregroundColor(Color.green)
                        .padding()
                
                    TextField("Fill in Text", text: $description)
                        .background(Rectangle().fill(Color.white).shadow(radius: 3).frame(width: width/1.2, height: height/15))
                        .foregroundColor(description.isEmpty ? Color.gray.opacity(0.3):Color.black)
                        .font(.headline)
                    
                    Text("Image")
                        .font(.largeTitle).bold()
                        .foregroundColor(Color.green)
                        .padding()
              
                        Text(image == nil ? "Click To Upload":"Click To Change")
                            .background(Rectangle().fill(Color.blue).shadow(radius: 3).frame(width: width/1.2, height: height/15).opacity(0.7))
                            .foregroundColor(Color.white)
                            .font(.headline)
                            .onTapGesture { showImagePicker = true }
                        
                        if(image != nil)
                        {
                            image?
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(0.8)
                        }
                    
                    

                   
//                        .frame(width: width, height: height/10)
                    
                

                    Button{
//                        Activity.setName(name: name)
//                        Activity.setDescription(description: description)
                        if(image == nil)
                        {
                            return
                        }
                        
                        

                        createdNew = false
                    } label: {
                        Text("Create".uppercased())
                            .padding()
                            .background(Color.blue.opacity(1).cornerRadius(10))
                            .foregroundColor(Color.white)
                            .font(.headline)
                           
                    }.onChange(of: inputImage) {_ in loadImage()  }
                        .sheet(isPresented: $showImagePicker){
                            ImagePicker(image: $inputImage)
                        }
                    
                    Spacer()
                }
                
                
            }.frame(width: width/1.2, height: height/1.2)
            .background(Rectangle().fill(Color.white).shadow(radius: 3).frame(width: width/1.2, height: height/1.2))
           

        }
    }
    
    func loadImage(){
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}
