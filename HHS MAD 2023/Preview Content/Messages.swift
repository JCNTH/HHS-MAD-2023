//
//  ContentView.swift
//  HHS MAD 2023
//
//  Created by Dhruv B 2/5/23.
//

import SwiftUI

struct Messages: View {
    @State var name = "Julian Ng"
    @State var image = "https://hws.dev/paul.jpg"
    
    var body: some View {
        
        ZStack{
            //Background color
            Color(red: 231/255, green: 255/255, blue: 231/255)
                .ignoresSafeArea()
            
            // Top section
            Group {
                // Introductory Section
                VStack {
                    Text("Messeges")
                        .font(.system(size: 35, weight: .bold, design: .rounded))
                        .offset(x: -80)
                        .foregroundColor(Color.green)
                    
                    ScrollView{
                        VStack{
                            EnterChat(image: $image, name: $name)
                            EnterChat(image: $image, name: $name)
                            EnterChat(image: $image, name: $name)
                            EnterChat(image: $image, name: $name)
                            EnterChat(image: $image, name: $name)
                            EnterChat(image: $image, name: $name)
                            EnterChat(image: $image, name: $name)
                           
                           
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
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
    
    var body: some View {
        let imageUrl = URL(string: image)
        
      
        
        
        Button{
            
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
