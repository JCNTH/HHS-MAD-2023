//
//  MessagePage.swift
//  HHS MAD 2023
//
//  Created by Julian NTH on 3/11/23.
// https://www.youtube.com/watch?v=Zz9XQy8PRpQ

import SwiftUI

struct MessagePage: View {
    @StateObject var messagesManager = MessagesManager()
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
                    
                    //                    Button{
                    //                        chat = false
                    //                        showPage = false
                    //                    } label:
                    //                    {
                    //                        Image(systemName: "chevron.backward")
                    //                            .resizable()
                    //                            .frame(width: 15, height: 25)
                    //                            .background(Color("Green"))
                    //                    }
                    
                    TitleRow(imageUrl: $image, name: $name)
                        .offset(y: 20)
//                        .background(Color("Green"))
                    
                }.padding(.top, 22)
                  
//                }.padding(.leading, 10)
       
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.white)
                            .frame(width: width, height: height/1.55)
                   
                    ScrollViewReader { proxy in
                        ScrollView{
                                ForEach(messagesManager.messages, id: \.id) { message in MessageBubble(
                                    message: message)
                                }.onChange(of: messagesManager.lastMessageId) { id in
                                    withAnimation{
                                        proxy.scrollTo(id, anchor: .bottom)
                                    }
                                    
                                }
                                           
                                
                                
                                
    //                            if(!messageArray.isEmpty)
    //                            {
    //                                MessageBubble( message: Message(id: "123", text: "Thank you for reporting the bug! Our moderation team will review it as soon as possible! We will get back to you soon.", received: true, timestamp: Date()))
    ////                                    .offset(x: 30)
    //                            }
                               
                                
                                
                            }.padding(.top, 10)
                            .background(Color.white)
                            .frame(width: width, height: height/1.7)
                            .cornerRadius(50, corners: [.topLeft, .topRight])
                        
                    }
                            
                   
                        
                    
                       
                    
                }.offset(y: 22)
               
                MessageField(messageArray: $messageArray, message: $message)
                    .environmentObject(messagesManager)
                    .background(Color.white)
                
                

            }
            .padding(.bottom, 100)
            .background(Color("Green"))
            
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


