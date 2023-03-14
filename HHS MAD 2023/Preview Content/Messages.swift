//
//  ContentView.swift
//  HHS MAD 2023
//
//  Created by Dhruv B 2/5/23.
//

import SwiftUI

struct Messages: View {
    @State var name = "Julian Ng"
    @State var name2 = "Administration"
    @State var image = "https://hws.dev/paul.jpg"
    @State var image2 = "https://images.unsplash.com/photo-1497215728101-856f4ea42174?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3540&q=80"
    @State var showPage = false
    
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
                            .font(.system(size: 35, weight: .bold, design: .rounded))
                            .offset(x: -80)
                            .foregroundColor(Color.green)
                        
                        ScrollView{
                            VStack{
                                EnterChat(image: $image2, name: $name2, showPage: $showPage)
                                EnterChat(image: $image, name: $name, showPage: $showPage)
//                                EnterChat(image: $image, name: $name, showPage: $showPage)
//                                EnterChat(image: $image, name: $name, showPage: $showPage)
//                                EnterChat(image: $image, name: $name, showPage: $showPage)
//                                EnterChat(image: $image, name: $name, showPage: $showPage)
                             
                               
                               
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(30, corners: [.topLeft, .topRight])
                    }
                }
                
                if(showPage)
                {
                    MessagePage()
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
   
    @Binding var image: String
    @Binding var name: String
    @Binding var showPage: Bool
    
    var body: some View {
        let imageUrl = URL(string: image)
        
      
        
        
        Button{
            showPage = true
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
                        .font(.title).bold()
                    
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
            .padding()
          
            
            
                

        }
    }
}
