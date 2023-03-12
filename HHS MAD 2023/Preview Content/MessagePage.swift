//
//  MessagePage.swift
//  HHS MAD 2023
//
//  Created by Julian NTH on 3/11/23.
// https://www.youtube.com/watch?v=Zz9XQy8PRpQ

import SwiftUI

struct MessagePage: View {
    var messageArray = ["Hello you", "How are you doing?", "I've been building SwiftUI applications from scratch and it's so much fun!"]
    
    var body: some View {
        
        VStack {
            
            VStack{
                TitleRow()
                
                ScrollView{
                    ForEach(messageArray, id: \.self) { text in MessageBubble(message: Message(id: "123", text: text, received: true, timestamp: Date()))
                        
                    }
                }.padding(.top, 10)
                    .background(.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
            }
            .background(Color(red: 231/255, green: 255/255, blue: 231/255))
            
            MessageField()
        }
    }
}

struct MessagePage_Previews: PreviewProvider {
    static var previews: some View {
        MessagePage()
            
    }
}


