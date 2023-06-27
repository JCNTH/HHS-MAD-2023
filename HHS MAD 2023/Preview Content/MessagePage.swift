//
//  MessagePage.swift
//  HHS MAD 2023
//
//  Created by Julian NTH on 3/11/23.
// https://www.youtube.com/watch?v=Zz9XQy8PRpQ

import SwiftUI
import Firebase
import FirebaseAuth

struct MessagePage: View {
    @StateObject var messagesManager = MessagesManager()
    @StateObject var bugManager = BugManager()

    @ObservedObject var vm = MainMessagesViewModel()
    @State var messageArray: Array<String>
    @State var message = ""
    @Binding var showPage: Bool
    @Binding var name: String
    @Binding var image: URL
    @Binding var chat: Bool
    
    let type: String
//    @State 
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    
    var body: some View {
    
            
        
        VStack {
//            Text("CURRENT USER ID: \(vm.errorMessage)")
            
            VStack{
                HStack{
                    
                  Button{
                         chat = false
                         showPage = false
                         } label:
                         {
                             Image(systemName: "chevron.backward")
                               .resizable()
                               .frame(width: 12, height: 20)
                               .foregroundColor(Color.white)
                               .background(RoundedRectangle(cornerRadius: 10, style: .continuous).frame(width: 30, height: 30).foregroundColor(Color.black).opacity(0.75))
                         }
                    
                    TitleRow(imageUrl: $image, name: $name)
                     
//                        .background(Color("Green"))
                    
                }.padding(.top, 22).offset(x: 20, y: 20)
                  
//                }.padding(.leading, 10)
       
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.white)
                            .frame(width: width, height: height/1.55)
                   
                    ScrollViewReader { proxy in
                        ScrollView{
                                
                                
                                if(type == "bug")
                                {
                                    ForEach(bugManager.messages, id: \.id) { message in MessageBubble(
                                        message: message)
                                        
                                    }.onChange(of: messagesManager.lastMessageId) { id in
                                        withAnimation{
                                            proxy.scrollTo(id, anchor: .bottom)
                                        }
                                        
                                    }

                                }
                            else {
                                ForEach(messagesManager.messages, id: \.id) { message in MessageBubble(
                                    message: message)
                                }.onChange(of: messagesManager.lastMessageId) { id in
                                    withAnimation{
                                        proxy.scrollTo(id, anchor: .bottom)
                                    }
                                    
                                }
                            }
                               
                                
                                
                            }.padding(.top, 10)
                            .background(Color.white)
                            .frame(width: width, height: height/1.7)
                            .cornerRadius(50, corners: [.topLeft, .topRight])
                        
                    }
                            
                   
                        
                    
                       
                    
                }.offset(y: 22)
               
                if(type == "bug")
                {
                    BugMessageField(messageArray: $messageArray, message: $message)
                        .environmentObject(bugManager)
                        .background(Color.white)
                }
                else {
                    MessageField(messageArray: $messageArray, message: $message)
                        .environmentObject(messagesManager)
                        .background(Color.white)
                }
              
                
                

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


class MainMessagesViewModel: ObservableObject {
    
    @Published var errorMessage = ""
    
    
    init(){
        fetchCurrentUser()
    }
    
    private func fetchCurrentUser(){
        let db = Firestore.firestore()

        guard let userID = Auth.auth().currentUser?.uid else { return }
        
//    self.errorMessage = "\(userID)"

      db.collection("Authentication")
            .document(userID).getDocument { snapshot, error in
                guard let snapshot = snapshot, error == nil else {
                    self.errorMessage = "aw man"
                     return
                   }
                
                if let error = error {
                    print("Failed to fetch current user", error)
//                    self.errorMessage = "Could not find firebase uid"
                    return
                }
                
                
                guard let data = snapshot.data() else {
//                    self.errorMessage = "Could not find firebase uid"

                    return }
                print(data)
                
                self.errorMessage = "Data: \(data.description)"

            }

    }
}


