//
//  MessagePage.swift
//  HHS MAD 2023
//
//  Created by Julian NTH on 3/11/23.
// https://www.youtube.com/watch?v=Zz9XQy8PRpQ

import SwiftUI

struct MessagePage: View {
    @State var messageArray: Array<String>
    @State var message = ""
    @Binding var showPage: Bool
    @Binding var name: String
    @Binding var image: URL
    @Binding var chat: Bool
//    @State 
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    
    var body: some View {
        
        
        VStack {
            
            VStack{
                HStack{
                    
                    Button{
                        chat = false
                        showPage = false
                    } label:
                    {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .frame(width: 15, height: 25)
                    }
                    
                    TitleRow(imageUrl: $image, name: $name)
                    
                    
                  
                }.padding(.leading, 10)
       
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.white)
                            .frame(width: width/1.1, height: height/1.7)
                   
                        ScrollView{
                            ForEach(messageArray, id: \.self) { text in MessageBubble(
                                message: Message(id: "123", text: text, received: true, timestamp: Date()))
                            }
                            
                            if(!messageArray.isEmpty)
                            {
                                MessageBubble( message: Message(id: "123", text: "Thank you for reporting the bug! Our moderation team will review it as soon as possible! We will get back to you soon.", received: true, timestamp: Date()))
                                    .offset(x: 30)
                            }
                           
                            
                            
                        }.padding(.top, 10)
                            .cornerRadius(30, corners: [.topLeft, .topRight])
                            .frame(width: width, height: 1.7*height/3)
                            
                   
                        
                    
                       
                    
                }
               
                MessageField(messageArray: $messageArray, message: $message)
                
                

            }
            .background(Color(red: 231/255, green: 255/255, blue: 231/255))
            .padding(.bottom, height/7)
            
        }
    }
}
//
//struct MessagePage_Previews: PreviewProvider {
//    static var previews: some View {
//        MessagePage()
//            
//    }
//}


