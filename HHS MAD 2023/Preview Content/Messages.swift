//
//  ContentView.swift
//  HHS MAD 2023
//
//  Created by Dhruv B 2/5/23.
//

import SwiftUI

struct Messages: View {
    @State var name = "Ms. Kimberly"
    @State var name2 = "Administration"
    @State var name4 = "Bug Reports"
    @State var image = "teacher"
    @State var image2 = "admin"
    @State var image4 = "bug"
    @State var image5 = "shumar"
    @State var showPage = false
    @State var name5 = "Shumar"
    @State var name3 = ""
    @State var image6 = "harjeet"
    @State var name6 = "Harjeet Singh"
    @State var name7 = "Josh"
    @State var image7 = "josh"
    
    @State var bugReports = false
    @State var administration = false
    @State var kimberly = false
    @State var shumar = false
    //Screen Length & Width to adjust for different phone sizes
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height

    
    var body: some View {
        
        ZStack{
           
            
            // Top section
            Group {
                //Background color
                Color(red: 255/255, green: 255/255, blue: 255/255)
                    .ignoresSafeArea()
                // Introductory Section
                
                if(!showPage){
                    VStack {
                        Text("Messages")
                            .font(.system(size: 30, weight: .medium, design: .rounded))
                            .offset(x: -100)
                            .foregroundColor(Color.black)
                        
                        Image ("hot")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(width:45.0, height: 50.0, alignment: .center)
                            .offset(x:width/2.7, y: -60)
                        
                        CustomTextField2(placeholder: Text("Search"), text: $name3)
                            .frame(height: 52)
                            .disableAutocorrection(true)
                        
                        ScrollView {
                            
                            EnterChat(chat: $administration, image: $image2, name: $name2, showPage: $showPage)
                                .padding(.vertical, 5)
                            EnterChat(chat: $bugReports, image: $image4, name: $name4, showPage: $showPage)
                                .padding(.vertical, 5)
                            EnterChat(chat: $kimberly, image: $image, name: $name, showPage: $showPage)
                                .padding(.vertical, 5)
                            EnterChat(chat: $shumar, image: $image5, name: $name5, showPage: $showPage)
                                .padding(.vertical, 5)
                            EnterChat(chat: $bugReports, image: $image7, name: $name7, showPage: $showPage)
                                .padding(.vertical, 5)
                            EnterChat(chat: $shumar, image: $image6, name: $name6, showPage: $showPage)
                                .padding(.vertical, 5)
                          
                  
//                            EnterChat(image: $image, name: $name, showPage: $showPage)
//                                .padding(.vertical, 5)
//                            EnterChat(image: $image, name: $name, showPage: $showPage)
//                                .padding(.vertical, 5)
//                            EnterChat(image: $image, name: $name, showPage: $showPage)
//                                .padding(.vertical, 5)
//                            EnterChat(image: $image, name: $name, showPage: $showPage)
//                                .padding(.vertical, 5)
                        }
                        .offset(y: -30)
              
                       
                    }.offset(y: 50)
                }
                
                if(showPage)
                {
                    
                    if(administration)
                    {
                        MessagePage(messageArray: [String](), showPage: $showPage, name: $name2, image: $image2, chat: $administration, type: "admin")
                         
                    }
                  
                    else if(bugReports)
                    {
                        MessagePage(messageArray: [String](), showPage: $showPage, name: $name4, image: $image4, chat: $bugReports, type: "bug")
                               
                    }
                    else{
                        MessagePage(messageArray: [String](), showPage: $showPage, name: $name, image: $image, chat: $bugReports, type: "asd")
                               
                    }
                    
                  
                }
               
                
            
                
            }
        }.offset(y: -40)
       
       
        
        
        
    }
}

struct Messages_Previews: PreviewProvider {
    static var previews: some View {
        Messages()
    }
}

struct EnterChat: View{
   
    @Binding var chat: Bool
    @Binding var image: String
    @Binding var name: String
    @Binding var showPage: Bool
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    var body: some View {
        
      
        
        
        Button{
            showPage = true
            chat = true
        } label: {
            
            HStack(spacing: 20){
                
                
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .cornerRadius(50)
                
                VStack(alignment: .leading)
                {
                    Text(name)
                        .font(.system(size: 25)).bold()
                        .foregroundColor(Color.black)
                    
                    Text("Online")
                        .font(.caption)
                        .foregroundColor(.gray)
                }.frame(maxWidth: width/2, alignment: .leading)
                
                
//                Image(systemName: "phone.fill")
//                    .foregroundColor(.gray)
//                    .padding(10)
//                    .background(.white)
//                    .cornerRadius(50)
            }
            .padding(.trailing, 60.0)
            .background(RoundedRectangle(cornerRadius: 0)
                .fill(Color(red: 255/255, green: 255/255, blue: 255/255))
                .frame(width: width/1.2, height: height/10))
//            .padding()
            
        
        }
        
        Divider()
            .frame(width: width, height:1)
            .background(Color.green)
            .opacity(0.5)
    }
}


struct CustomTextField2: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height

    
    var body: some View {
        
        ZStack(alignment: .leading) {
            // If text is empty, show the placeholder on top of the TextField
            if text.isEmpty {
                placeholder
                .font(.system(size: 20))
                .offset(x: 80)
//                .opacity(0.5)
            }
            
        
            HStack{
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .offset(x: 45)
//                    .opacity(0.8)
                
                TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
                    .offset(x: 50)
            }
           
        }.background(RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(Color(red: 197/255, green: 196/255, blue: 196/255))
            .frame(width: width/1.1, height: height/15))
        .offset(y: -50)
        .opacity(0.4)

    }
}
