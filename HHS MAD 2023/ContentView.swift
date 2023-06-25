//
//  ContentView.swift
//  HHS MAD 2023
//
//  Created by Julian NTH, Aaditya, and Dhruv on 1/28/23.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State var userLoggedIn = false;
    @State var email = "";
    @State var password = "";
    var body: some View {
//        if userLoggedIn {
//            Activities();
//        } else {
//            loginPage;
//        }
        
        Activities();
    }
    
    var loginPage: some View {
        ZStack {
            Color(red: 50/255, green: 75/255, blue: 50/255)
            VStack {
                Image("MAD_LOGOS-removebg-preview")
                    .resizable()
                    .frame(width: 210, height: 225)
                ZStack {
//                    Rectangle()
//                        .foregroundStyle(
//                            LinearGradient(
//                                colors: [Color(red: 85/255, green: 172/255, blue: 85/255), Color(red: 50/255, green: 75/255, blue: 50/255)],
//                                startPoint: .topLeading,
//                                endPoint: .bottomTrailing
//                            )
//                        )
//                        .frame(width: 400, height: 450)
//        //                .rotationEffect(.degrees(-25))
//        //                .offset(y: -100)
                    
                    VStack(spacing: 20) {

                        Text("Welcome")
                            .foregroundColor(.white)
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .offset(x: -100)
                        
                        TextField("Email", text: $email)
                            .foregroundColor(.white)
                            .textFieldStyle(.plain)
                            .placeholder(when: email.isEmpty) {
                                Text("Email")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        
                        Rectangle()
                            .frame(width: 350, height: 1)
                            .foregroundColor(.white)
                        
                        SecureField("Password", text: $password)
                            .foregroundColor(.white)
                            .textFieldStyle(.plain)
                            .placeholder(when: password.isEmpty) {
                                Text("Password")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        
                        Rectangle()
                            .frame(width: 350, height: 1)
                            .foregroundColor(.white)
                        
                        Button {
                            login()
                        } label: {
                            Text("Login")
                                .bold()
                                .frame(width: 200, height: 40)
                                .background(Capsule()
                                    .fill(.linearGradient(colors: [.green], startPoint: .topLeading, endPoint: .bottomTrailing)))
                                .foregroundColor(.black)
                        }
                        
                        Button {
                            signUp()
                        } label: {
                            Text("Don't have an account? Sign up")
                                .bold()
                        }
                        
                        
                            
                    }.frame(width: 350)
                        .onAppear {
                            Auth.auth().addStateDidChangeListener { auth, user in
                                userLoggedIn = (user != nil)
                            }
                        }
                }.ignoresSafeArea()
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all, -50.0/*@END_MENU_TOKEN@*/)
        
//        .background(LinearGradient(
//            colors: [Color(red: 85/255, green: 172/255, blue: 85/255), Color(red: 50/255, green: 75/255, blue: 50/255)],
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing)
//        )
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if (error != nil) {
                print(error!.localizedDescription)
            }
        }
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if (error != nil) {
                print(error!.localizedDescription)
            }
        }
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

