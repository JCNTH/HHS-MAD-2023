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
    @State var image = URL(string: "https://i.pinimg.com/736x/17/fa/44/17fa44e8d7f0d4a341f078b6c94a31ef.jpg")!
    @State var image2 = URL(string: "https://images.unsplash.com/photo-1497215728101-856f4ea42174?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3540&q=80")!
    @State var image4 = URL(string: "https://cdn-icons-png.flaticon.com/512/637/637773.png")!
    @State var image5 = URL(string: "https://media.licdn.com/dms/image/C5603AQFjpZmmC3DaaA/profile-displayphoto-shrink_800_800/0/1664049098298?e=2147483647&v=beta&t=3Z65mj4tu8bnDZsAlJrz_BUtxLzsAjpJnIYE1QEz5F0")!
    @State var showPage = false
    @State var name5 = "Shumar"
    @State var name3 = ""
    @State var image6 = URL(string: "data:image/jpeg;base64,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")!
    @State var name6 = "Harjeet Singh"
    @State var name7 = "Josh"
    @State var image7 = URL(string: "https://imageio.forbes.com/specials-images/imageserve/5f357cb08c6fa5a90697d3c2/josh-richards--tiktok--sway-house/960x0.jpg?format=jpg&width=960")!
    
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
            //Background color
            Color(red: 231/255, green: 255/255, blue: 231/255)
                .ignoresSafeArea()
            
            // Top section
            Group {
                // Introductory Section
                
                if(!showPage){
                    VStack {
                        Text("Messages")
                            .font(.system(size: 35, weight: .medium, design: .rounded))
                            .offset(x: -80)
                            .foregroundColor(Color.black)
                        
                        Image ("hot")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(width:60.0, height: 60.0, alignment: .center)
                            .offset(x:width/3.3, y: -80)
                        
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
                        .offset(y: -25)
              
                       
                    }.offset(y: 20)
                }
                
                if(showPage)
                {
                    
                    if(administration)
                    {
                        MessagePage(messageArray: [String](), showPage: $showPage, name: $name2, image: $image2, chat: $administration)
                         
                    }
                  
                    else if(bugReports)
                    {
                        MessagePage(messageArray: [String](), showPage: $showPage, name: $name4, image: $image4, chat: $bugReports)
                               
                    }
                    else{
                        MessagePage(messageArray: [String](), showPage: $showPage, name: $name, image: $image, chat: $bugReports)
                               
                    }
                    
                  
                }
               
                
            
                
            }
        }
       
       
        
        
        
    }
}

struct Messages_Previews: PreviewProvider {
    static var previews: some View {
        Messages()
    }
}

struct EnterChat: View{
   
    @Binding var chat: Bool
    @Binding var image: URL
    @Binding var name: String
    @Binding var showPage: Bool
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    var body: some View {
        let imageUrl = image
        
      
        
        
        Button{
            showPage = true
            chat = true
        } label: {
            
            HStack(spacing: 20){
                
                
                AsyncImage(url: imageUrl) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(50)
                    
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading)
                {
                    Text(name)
                        .font(.title)
                        .foregroundColor(Color.black)
                    
                    Text("Online")
                        .font(.caption)
                        .foregroundColor(.gray)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: "phone.fill")
                    .foregroundColor(.gray)
                    .padding(10)
                    .background(.white)
                    .cornerRadius(50)
            }
            .background(RoundedRectangle(cornerRadius: 0)
                .fill(Color(red: 200/255, green: 255/255, blue: 200/255))
                .frame(width: width/1.1, height: height/10))
            .padding()
            
            Spacer()
          
            
            
                

        }
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
                    .offset(x: 40)
                .opacity(0.5)
            }
            
        
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
                .offset(x: 40)
        }.background(RoundedRectangle(cornerRadius: 25, style: .continuous)
            .fill(Color.white)
            .frame(width: width/1.1, height: height/15))
        .offset(y: -50)
        .shadow(radius: 5)
    }
}
