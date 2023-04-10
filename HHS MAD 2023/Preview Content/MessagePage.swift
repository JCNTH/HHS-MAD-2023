//
//  MessagePage.swift
//  HHS MAD 2023
//
//  Created by Julian NTH on 3/11/23.
// https://www.youtube.com/watch?v=Zz9XQy8PRpQ

import SwiftUI

struct MessagePage: View {
    var messageArray = ["Hello!", "I am sick today. I won't be able to make it to school", "My full name is Julian Ng-Thow-Hing. Please mark me absent."]
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
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
                    .frame(width: width, height: 1.7*height/3)
                
                
                MessageField()

            }
            .background(Color(red: 231/255, green: 255/255, blue: 231/255))
            .padding(.bottom, height/10)
            
        }
    }
}

struct MessagePage_Previews: PreviewProvider {
    static var previews: some View {
        MessagePage()
            
    }
}


