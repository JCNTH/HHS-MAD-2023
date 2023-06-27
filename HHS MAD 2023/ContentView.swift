//
//  ContentView.swift
//  HHS MAD 2023
//
//  Created by Julian NTH, Aaditya, and Dhruv on 1/28/23.
//

import SwiftUI
import FirebaseAuth


struct ContentView: View {
    @State var calendarVM = CalendarPageViewModel();
    @State var userLoggedIn = false;
    @State var loginBtnText  = "Login";
    @State var showLoginAlert = false;
    @State var showCreationPage = false;
    @State var errorText = "";
    @State var email = "";
    @State var password = "";
    @State var firstName = "";
    @State var lastName = "";
    @State var name = "User";
    
    @State var activitiesCurrent = ActivityManager()
    var body: some View {

        if userLoggedIn {
            Activities(activitiesCurrent: $activitiesCurrent, name: name).environmentObject(calendarVM);
        } else {
            loginPage;
        }
        
//        Activities(name: name)

    }
    
    var loginPage: some View {
        ZStack {
            Color(red: 50/255, green: 75/255, blue: 50/255)
            VStack {
                Image("MAD_LOGOS-removebg-preview")
                    .resizable()
                    .frame(width: 210, height: 225)
                ZStack {
                    VStack(spacing: 20) {
                        
                        let welcomeText = showCreationPage ? "Create Account" : "Welcome";
                        Text(welcomeText)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .italic()
                        
                        if (showCreationPage) {
                            HStack {
                                VStack {
                                    TextField("First Name", text: $firstName)
                                        .foregroundColor(.white)
                                        .textFieldStyle(.plain)
                                        .placeholder(when: firstName.isEmpty) {
                                            Text("First Name")
                                                .foregroundColor(.white)
                                                .bold()
                                    }
                                    Rectangle()
                                        .frame(width: 175, height: 1)
                                        .foregroundColor(.white)
                                }
                                
                                VStack {
                                    TextField("Last Name", text: $lastName)
                                        .foregroundColor(.white)
                                        .textFieldStyle(.plain)
                                        .placeholder(when: lastName.isEmpty) {
                                            Text("Last Name")
                                                .foregroundColor(.white)
                                                .bold()
                                    }
                                    Rectangle()
                                        .frame(width: 175, height: 1)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        
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
                            showCreationPage ? signUp() : login()
                        } label: {
                            Text(loginBtnText)
                                .bold()
                                .frame(width: 200, height: 40)
                                .background(Capsule()
                                    .fill(.linearGradient(colors: [.green], startPoint: .topLeading, endPoint: .bottomTrailing)))
                                .foregroundColor(.black)
                        }
                        
                        
                        let subText = showCreationPage ? "Already have an account? Login" : "Don't have an account? Sign up"
                        Button {
                            showCreationPage.toggle();
                        } label: {
                            Text(subText)
                                .bold()
                        }
                        
                        
                            
                    }.frame(width: 350)
                        .onAppear {
                            Auth.auth().addStateDidChangeListener { auth, user in
                                userLoggedIn = (user != nil)
                                if (!userLoggedIn) {
                                    loginBtnText  = "Login";
                                    showCreationPage = false;
                                    errorText = "";
                                    email = "";
                                    password = "";
                                    firstName = "";
                                    lastName = "";
                                } else {
                                    name = auth.currentUser?.displayName ?? "User";
                                }
                            }
                        }
                }.ignoresSafeArea()
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all, -50.0/*@END_MENU_TOKEN@*/)
        .alert(isPresented: $showLoginAlert) { () -> Alert in
            Alert(title: Text(errorText))
        }
    }
    
    func login() {
        loginBtnText = "Logging in..."
        Auth.auth().signIn(withEmail: email, password: password) { auth, error in
            if let x = error {
                loginBtnText = "Login"
                showLoginAlert = true;
                  let err = x as NSError
                  switch err.code {
                      case AuthErrorCode.wrongPassword.rawValue:
                      print("Incorrect Password")
                      errorText = "Incorrect Password";
                      break;
                      case AuthErrorCode.invalidEmail.rawValue:
                          print("Invalid email")
                      errorText = "Invalid Email";
                      break;
                      case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
                          print("Account already exists")
                      errorText = "Account already exists";
                      break;
                  default:
                      print("\(err.localizedDescription)")
                      errorText = "Unknown error \(err.localizedDescription)";
                  }
            } else {
                showLoginAlert = false;
                if let _ = auth?.user {
                    userLoggedIn = true;
                    name = Auth.auth().currentUser?.displayName ?? "User"
                  print("Authenticated")
                } else {
                  print("No authenticated user")
                }
            }
        }
    }
    
    func signUp() {
        loginBtnText = "Signing in..."
        showCreationPage = true;
        Auth.auth().createUser(withEmail: email, password: password) { auth, error in
            if let x = error {
                loginBtnText = "Login"
                showLoginAlert = true;
                  let err = x as NSError
                  switch err.code {
                      case AuthErrorCode.invalidEmail.rawValue:
                      print("Invalid email")
                      errorText = "Invalid Email";
                      break;
                      case AuthErrorCode.emailAlreadyInUse.rawValue:
                      print("Email already in use")
                      errorText = "Email already in use";
                      break;
                      case AuthErrorCode.weakPassword.rawValue:
                      print("Weak password")
                      errorText = "Weak password: \(err.localizedDescription)";
                      break;
                  default:
                      print("\(err.localizedDescription)")
                      errorText = "Unknown error \(err.localizedDescription)";
                  }
            } else {
                showLoginAlert = false;
                if let _ = auth?.user {
                    let changeRequest = auth?.user.createProfileChangeRequest()
                    changeRequest?.displayName = firstName + " " + lastName;
                    changeRequest?.commitChanges { error in
                        if (error != nil) {
                            print(error!.localizedDescription)
                        }
                    }
                    userLoggedIn = true;
                    name = firstName + " " + lastName
                  print("Authenticated")
                } else {
                  print("No authenticated user")
                }
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

