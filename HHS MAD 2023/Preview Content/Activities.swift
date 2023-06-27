//
//  ContentView.swift
//  HHS MAD 2023
//
//  Created by Dhruv B 2/5/23.
//

import SwiftUI
import FirebaseAuth
//import NSApplication

struct Activities: View {
    
    @EnvironmentObject var calendarVM : CalendarPageViewModel
    
    //Boolean variables for activities page
    @State var photos = false
    @State var events = false
    @State var clubs = false
    @State var social = true
    
    //Text variables
    @State var Social = "Social"
    @State var Clubs = "Clubs"
    @State var Photos = "Photos"
    @State var Events = "Events"
    
    //Bottom menu variables
    @State var home = true
    @State var messages = false
    @State var calendar = false
    @State var academics2 = false
    
    //image variables
    @State var SocialImage = "network"
    @State var EventImage = "clock"
    @State var ClubImage = "person.2.fill"
    @State var PhotoImage = "camera"
    
    
    //Clubs
    @State var FBLA_IMAGE = "FBLA_logo"
    @State var FBLA_NAME = "FBLA"
    @State var FBLA_STATE = false
    @State var ROBOTICS_IMAGE = "Robotics_logo"
    @State var ROBOTICS_NAME = "Robotics"
    @State var ROBOTICS_STATE = false
    @State var CHESS_IMAGE = "chess_piece"
    @State var CHESS_NAME = "Chess"
    @State var CHESS_STATE = false
    @State var SHOGI_IMAGE = "https://thumb.ac-illust.com/71/712219560b878987046a1452d98051b1_t.jpeg"
    @State var SHOGI_NAME = "Shogi"
    @State var SHOGI_STATE = false
    @State var DATA_IMAGE = "https://png.pngtree.com/element_our/20190603/ourlarge/pngtree-data-analysis-cartoon-illustration-image_1430283.jpg"
    @State var DATA_NAME = "Data Analysis"
    @State var DATA_STATE = false
    
    @State var showDescription = false
    @State var showMenu = false
    private let defaults = UserDefaults.standard
    
    //Screen Length & Width to adjust for different phone sizes
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    @Binding var activitiesCurrent: ActivityManager
    
    @State private var currentIndex = 0
    let images = ["homestead1", "homestead2", "homestead3"]
    
    let images2 = ["fbla1", "fbla1", "fbla1"]
    
    @State var name : String;
    
    var body: some View {
        ZStack{
            //Start page, home page
            if (home) {
                ZStack {
                    //Background color
                    //                    Color(red: 231/255, green: 255/255, blue: 231/255)
                    //                        .ignoresSafeArea()
                    
                    Color(red: 255/255, green: 255/255, blue: 255/255)
                        .ignoresSafeArea()
                    
                    
                    
                    // Top section
                    Group {
                        
                        // Introductory Section.
                        // Creates the profile picture of the user and also displays the user's name.
                        // Additional information is displayed such as the current weather at the school.
                        // as well as a picture.
                        //                        var currentUser = Auth.auth().currentUser;
                        //                        var name = currentUser != nil ? currentUser.displayName : "Julian"
                        Group {
                            Text("Hi, " + name.split(separator: " ")[0] + "!")
                                .padding()
                                .font(.system(size: 25, weight: .medium, design: .rounded))
                                .offset(x: -width/3.6, y: -355)
                            
                            Text("Welcome to HHS Connect")
                                .padding()
                                .font(.system(size: 20, design: .rounded))
                                .offset(x: -width/7.6, y: -320)
                            
                            
                            
                            
                            Button {
                                //                                do {
                                //                                    try Auth.auth().signOut();
                                //                                } catch {
                                //                                    print("Sign out error!")
                                //                                }
                                withAnimation {
                                    showMenu = true
                                }
                                
                            } label: {
                                Image ("hot")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .offset(y: 10)
                                    .frame(width:70.0, height: 70.0, alignment: .center)
                                    .clipShape(Circle())
                                    .offset(x: width/7.2, y: -27)
                                
                                Image("menu")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(.white)
                                    .frame(width: 20.0, height: 20.0)
                                    .bold()
                                    .background(RoundedRectangle(cornerRadius: 10, style: .continuous).frame(width: 25, height: 25).foregroundColor(Color.green).opacity(0.75))
                                    .offset(x: -22)
                            }.offset(x: width/4.1, y: -335)
                        }
                        
                        
                        //School image and weather section
                        Group {
                            VStack {
                                Image(images[currentIndex])
                                    .resizable ()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: width-(width/7), height: 160)
                                    .cornerRadius(20)
                                    .shadow(color: .black, radius: 4, x: 0, y: 0)
                                    .offset(x:0, y:165)
                                
                                //
                                
                                HStack{
                                    ForEach(0..<images.count, id: \.self){ index in
                                        Circle()
                                            .fill (self.currentIndex == index ? Color.green : Color.brown)
                                            .frame (width: 12, height: 12)
                                    }
                                } .offset(x: 0, y:130)
                                
                                Spacer ()
                            }
                            .padding ()
                            .onAppear {
                                
                                
                                Timer.scheduledTimer(withTimeInterval: 3, repeats: true){ timer in
                                    if self.currentIndex + 1 == self.images.count {
                                        self.currentIndex = 0
                                    } else{
                                        self.currentIndex += 1
                                    }
                                }
                            }
                        }
                        //                            Text("72° F ⛅")
                        //                                .padding()
                        //                                .font(.system(size: 18, weight: .bold, design: .rounded))
                        //                                .offset(x: -width/3.3, y: -height/6)
                        //                                .foregroundColor(.white)
                    }
                    
                    
                    
                    //Middle Section
                    Group {
                        
                        // Activities topic selector
                        Group {
                            
                            ZStack{
                                //                                RoundedRectangle( cornerRadius: 13, style: .continuous)
                                //                                    .frame(width: width/1.2, height: height/20)
                                
                                
                                //                                Divider()
                                //                                    .frame(width: width/1.1, height:3)
                                //                                    .background(Color.gray)
                                //                                    .offset(y: height/41)
                                //                                @State var SocialImage = "person.badge.plus"
                                //                                @State var EventImage = "clock"
                                //                                @State var ClubImage = "person.2.fill"
                                //                                @State var PhotoImage = "camera"
                                HStack(spacing: 20){
                                    Button_(text: $Social, state: $social, other1: $events, other2: $clubs, other3: $photos, image: $SocialImage)
                                    Button_(text: $Events, state: $events, other1: $social, other2: $clubs, other3: $photos, image: $EventImage)
                                    Button_(text: $Clubs, state: $clubs, other1: $events, other2: $social, other3: $photos, image: $ClubImage)
                                    Button_(text: $Photos, state: $photos, other1: $events, other2: $clubs, other3: $social, image: $PhotoImage)
                                    
                                    
                                }
                                
                                
                            }
                            .padding(.bottom, height/7.5)
                        }
                        
                        
                        //Photos Page
                        if(photos){
                            PhotoSharing()
                                .padding(.top, height/2.1)
                        }
                        
                        //Events Page
                        if(events){
                            CalendarUI(numDates: 5).environmentObject(calendarVM)
                                .padding(.top, height/4)
                        }
                        
                        //Clubs Page
                        if(clubs){
                            ZStack {
                                VStack{
                                    ScrollView{
                                        ClubDescription2(image: $FBLA_IMAGE, name: $FBLA_NAME, showDescription: $showDescription, state: $FBLA_STATE)
                                        ClubDescription2(image: $ROBOTICS_IMAGE, name: $ROBOTICS_NAME, showDescription: $showDescription, state: $ROBOTICS_STATE)
                                        ClubDescription2(image: $CHESS_IMAGE, name: $CHESS_NAME, showDescription: $showDescription, state: $CHESS_STATE)
                                        ClubDescription(image: $SHOGI_IMAGE, name: $SHOGI_NAME, showDescription: $showDescription, state: $SHOGI_STATE)
                                        ClubDescription(image: $DATA_IMAGE, name: $DATA_NAME, showDescription: $showDescription, state: $DATA_STATE)
                                        
                                    }
                                    
                                }.padding(.top, height/1.9)
                                
                                if(showDescription)
                                {
                                    VisualEffectView(effect: UIBlurEffect(style: .dark))
                                        .opacity(0.5)
                                        .transition(.moveAndFade)
                                    //If "FBLA" club is selected
                                    if(FBLA_STATE){
                                        ZStack{
                                            
                                            //FBLA club description
                                            ScrollView{
                                                
                                                
                                                
                                                VStack(alignment: .center, spacing: 20){
                                                    //School image and weather section
                                                    
                                                    
                                                    VStack(spacing: 20){
                                                        Text("About the Club")
                                                            .font(.system(size: 22, weight: .medium, design: .default)).bold()
                                                            .foregroundColor(Color.black)
                                                            .multilineTextAlignment(.center)
                                                            .padding(.trailing, 125)
                                                        
                                                        HStack{
                                                            Divider()
                                                                .frame(maxWidth: 2)
                                                                .background(Color.gray)
                                                            
                                                            //                                                            .rotationEffect(.degrees(-90))
                                                            
                                                            
                                                            Text("Homestead FBLA currently has 4 projects. The projects consist of the American Enterprise Project, the Community Service Project, the Partnership with Business Project, and the Software Ventures Project.")
                                                                .fixedSize(horizontal: false, vertical: true)
                                                                .font(.system(size: 17, weight: .light, design: .default))
                                                                .multilineTextAlignment(.leading)
                                                            
                                                            
                                                            
                                                        }
                                                        
                                                        
                                                        
                                                        Text("Meeting Frequency")
                                                            .font(.system(size: 22, weight: .medium, design: .default)).bold()
                                                            .foregroundColor(Color.black)
                                                            .multilineTextAlignment(.leading)
                                                            .padding(.trailing, 80)
                                                        
                                                        HStack{
                                                            Divider()
                                                                .frame(maxWidth: 2)
                                                                .background(Color.gray)
                                                            
                                                            //                                                            .rotationEffect(.degrees(-90))
                                                            
                                                            
                                                            Text("Homestead FBLA holds a general meeting at the beginning of every month")
                                                                .fixedSize(horizontal: false, vertical: true)
                                                                .font(.system(size: 17, weight: .light, design: .default))
                                                                .multilineTextAlignment(.leading)
                                                            
                                                            
                                                            
                                                        }
                                                        
                                                        Text("Achievements")
                                                            .font(.system(size: 22, weight: .medium, design: .default)).bold()
                                                            .foregroundColor(Color.black)
                                                            .multilineTextAlignment(.leading)
                                                            .padding(.trailing, 135)
                                                        
                                                        HStack{
                                                            Divider()
                                                                .frame(maxWidth: 2)
                                                                .background(Color.gray)
                                                            
                                                            //                                                            .rotationEffect(.degrees(-90))
                                                            
                                                            
                                                            Text("Homestead FBLA 23 consecutive Bay Section Championships, 21 consecutive state championships, and 20 national championships.")
                                                                .fixedSize(horizontal: false, vertical: true)
                                                                .font(.system(size: 17, weight: .light, design: .default))
                                                                .multilineTextAlignment(.leading)
                                                            
                                                            
                                                            
                                                        }
                                                        
                                                    }
                                                    
                                                    
                                                }.frame(width: UIScreen.main.bounds.width/1.4, height: 450)
                                                
                                            }.frame(width: width/1.2, height: height/2.5)
                                                .offset(x: 0, y:95)
                                                .background(
                                                    
                                                    
                                                    ZStack(){
                                                        RoundedRectangle(cornerRadius: 5).fill(Color.white).shadow(radius: 3).frame(width: width/1.2, height: height/1.3)
                                                        
                                                        Group {
                                                            
                                                            
                                                            Image(images2[currentIndex])
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                .frame(width: width/1.2, height: 180)   .scaleEffect(x: 1.1, y: 1)
                                                                .cornerRadius(1)
                                                                .mask(LinearGradient(gradient:
                                                                                        Gradient(stops: [
                                                                                            .init(color: Color.white, location: 0),
                                                                                            .init(color: Color.white, location: 0.8),
                                                                                            .init(color: Color.white.opacity(0), location: 1.0)]), startPoint: .top, endPoint: .bottom))
                                                                .offset(x:0, y:-238)
                                                            
                                                            Button{
                                                                FBLA_STATE = false
                                                                showDescription = false
                                                            } label: {
                                                                Image(systemName: "xmark")
                                                                    .resizable()
                                                                    .frame(width: 15, height: 15)
                                                                    .background(RoundedRectangle(cornerRadius: 10, style: .continuous).frame(width: 30, height: 30).foregroundColor(Color.black).opacity(0.75))
                                                                
                                                                
                                                                
                                                            }.offset(x: -130, y: -280)
                                                            
                                                            Text("FBLA")
                                                                .font(.system(size: 30, weight: .medium, design: .default)).bold()
                                                                .foregroundColor(Color.black)
                                                                .multilineTextAlignment(.center)
                                                                .offset(x:0, y:-105)
                                                            
                                                            
                                                            Image("FBLA_logo") .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                .frame(width: 50, height: 80)
                                                                .offset(x:0, y:-150)
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            VStack {
                                                                Spacer ()
                                                            }
                                                            .padding ()
                                                            .onAppear {
                                                                
                                                                
                                                                Timer.scheduledTimer(withTimeInterval: 3, repeats: true){ timer in
                                                                    if self.currentIndex + 1 == self.images.count {
                                                                        self.currentIndex = 0
                                                                    } else{
                                                                        self.currentIndex += 1
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        
                                                        
                                                        
                                                    }
                                                    
                                                    
                                                    
                                                )
                                                .offset(y: -30)
                                            
                                            
                                            
                                            
                                            
                                        }.aspectRatio(1, contentMode: .fit)
                                        
                                        //                                        }
                                        
                                    }
                                    else if(ROBOTICS_STATE) {
                                        
                                    }
                                    else if(CHESS_STATE){
                                        
                                    }
                                    else if (SHOGI_STATE){
                                        
                                    }
                                    else if (DATA_STATE){
                                        
                                    }
                                }
                            }
                            
                        }
                        
                        //Acitivites page
                        if(social) {
                            ActivitiesPage(newActivity: $activitiesCurrent)
                                .padding(.top, 35)
                            //                                .onChange(of: activitiesCurrent) {_ in save()  }
                            
                        }
                        
                        
                        
                    }
                }
            }
            
            //Mesagges Page
            if(messages)
            {
                Messages()
                    .padding(.top, height/10)
                
            }
            
            //Calendar page
            if (calendar) {
                if (!(calendarVM.activeEventID.isEmpty)) {
                    VStack {
                        HStack {
                            Button(action: {
                                calendarVM.activeEventID = "";
                            }) {
                                Image(systemName: "arrow.backward")
                                    .padding([.leading, .bottom]).scaleEffect(2).foregroundColor(.black)
                                    
                            }
                            Spacer()
                        }
                        EventPage(event: calendarVM.getActiveEvent())
                    }
                } else {
                    CalendarPage().environmentObject(calendarVM)
                        
                }
            }
            
            
            
            //Forums Page
            if(academics2)
            {
                HHS_MAD_2023.Academics()
            }
            
            if(showMenu){
                exitPage(showMenu: $showMenu)
            }
            
            
            MenuScreen(home: $home, messages: $messages, calendar: $calendar, academics2: $academics2) .zIndex(3)
            
            
            
            ZStack{
                
                
                
                
                //                Circle()
                //                    .trim(from: 0, to: 0.5)
                //                    .frame(width: 400, height: 80)
                //                    .foregroundColor(Color(red: 231/255, green: 255/255, blue: 231/255))
                //                    .offset(y: -65)
                //    //                .clipShape(Circle())
                //
                //
                //
                Image("MAD_LOGOS-removebg-preview")
                    .resizable()
                    .frame(width: 105, height: 112.5)
                    .foregroundColor(Color(red: 231/255, green: 255/255, blue: 231/255))
                    .offset(y: -65)
                
                
                
            }.offset(y: 410)              .zIndex(4)
            
        }
        
        
        //        .onAppear(perform: load)
        //
        //        defaults.set(activitiesCurrent, forKey: "activities")
        
    }
    
    //    func save() {
    //        defaults.set(forKey: "activities")
    //
    //        activitiesCurrent = activity_saved
    //
    //      }
    //
    //    func load() {
    //        let activity_saved = defaults(forKey: "activities")
    //
    //        activitiesCurrent = activity_saved
    //
    //      }
    
}

//struct Activities_Previews: PreviewProvider {
//    static var previews: some View {
//        Activities(name: "Julian NTH").environmentObject(CalendarPageViewModel())
//    }
//}

//Button structure. Used for making the buttons of app.
struct Button_: View{
    @Binding var text: String
    @Binding var state: Bool
    @Binding var other1: Bool
    @Binding var other2: Bool
    @Binding var other3: Bool
    @Binding var image: String
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    var body: some View{
        Button{
            state = true
            other1 = false
            other2 = false
            other3 = false
        } label: {
            
            ZStack{
                VStack(spacing: 6){
                    Image(systemName: image)
                        .resizable().aspectRatio(contentMode: .fit).frame(width: 30, height: 30)
                        .foregroundColor(state ? Color.white:Color.black)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.75)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous).fill(state ? Color.green:Color.gray)
                            )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(state ? Color.green:Color.white)
                                    
                                )
                                    .frame(width: 65, height: 55))
                    
                    Text(text)
                        .foregroundColor(state ? Color.green:Color.black)
                        .font(.system(size: 14)).bold().multilineTextAlignment(.center)
                        .offset(x: 0, y: 9)
                    
                    
                    Divider()
                        .frame(width: width/6, height:3)
                        .background(state ? Color.green:Color.gray)
                        .offset(x: 0, y: 5)
                    
                    
                }.offset(x: 5, y: -14)
            }
            
            
            
            
            
            
            
        }
    }
}

struct Button_Forum: View{
    @Binding var text: String
    @Binding var state: Bool
    @Binding var other1: Bool
    @Binding var other2: Bool
    @Binding var other3: Bool
    @Binding var image: String
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    var body: some View{
        Button{
            state = true
            other1 = false
            other2 = false
            other3 = false
        } label: {
            
            ZStack{
                VStack(spacing: 6){
                    if (!state){
                        Image("Rect-White")
                            .resizable()
                            .frame(width: 9*width/39, height: 9*width/39)
                            .offset(x:0, y:72)
                        
                        Image(image)
                            .resizable().aspectRatio(contentMode: .fit).frame(width: 5*width/39, height: 5*width/39)
                            .foregroundColor(state ? Color.white:Color.black)
                            .offset(x:0, y:-5)
                        
                    } else {
                        Image("Rect-Gradient")
                            .resizable()
                            .frame(width: 9*width/39, height: 9*width/39)
                            .offset(x:0, y:72)
                        
                        Image(image)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fit).frame(width: 5*width/39, height:5*width/39)
                            .offset(x:0, y:-5)
                        
                    }
                    
                    Text(text)
                        .foregroundColor(state ? Color.green:Color.gray)
                        .font(.system(size: 14)).multilineTextAlignment(.center)
                        .offset(x: 0, y: -(19+7*width/39))
                    
                    
                    
                }.offset(x: 5, y: -14)
            }
            
            
            
            
            
            
            
        }
    }
}




//Button menu
struct Button_Menu: View{
    @Binding var text: String
    @Binding var state: Bool
    @Binding var other1: Bool
    @Binding var other2: Bool
    @Binding var other3: Bool
    
    var body: some View{
        
        //        Image(uiImage: UIImage(systemName: "\(text).fill") ?? UIImage(systemName: "questionmark.square.fill")!)
        
        Button{
            state = true
            other1 = false
            other2 = false
            other3 = false
        } label: {
            
            ZStack{
                Image(systemName: state ? text + ".fill" : text)
                    .resizable()
                    .frame(width: 35, height: 30)
                    .foregroundColor(state ? Color(red: 85/255, green: 172/255, blue: 85/255):Color.white)
                
                
                
                
            }
            
            
            
            
            
        }
    }
}

//Menuscreen (bottom switcher)
struct MenuScreen: View{
    @Binding var home: Bool
    @Binding var messages: Bool
    @Binding var calendar: Bool
    @Binding var academics2: Bool
    @State var Home = "house"
    @State var Messages = "message"
    @State var Calendar = "list.bullet.rectangle"
    @State var Academics = "book"
    
    var body: some View{
        
        ZStack{
            
            HStack(spacing: 0){
                CustomShape()
                    .fill(Color.black, style: FillStyle(eoFill: true, antialiased: true))
                    .shadow(radius: 10.0)
                    .rotationEffect(.radians(.pi/2))
                    .frame(width: 130, height: 150, alignment: .center)
                
                
                RoundedRectangle( cornerRadius: 0, style: .continuous)
                    .frame(width: 150, height: 130)
                
                
                //                .clipShape(Circle())
                
                
            }  .offset(x: 75)
            
            
            
            
            
            HStack(spacing: 100){
                HStack(spacing: 35){
                    Button_Menu(text: $Home, state: $home, other1: $messages, other2: $calendar, other3: $academics2 )
                    Button_Menu(text: $Messages, state: $messages, other1: $home, other2: $calendar, other3: $academics2 )
                    
                }
                
                HStack(spacing: 35){
                    Button_Menu(text: $Calendar, state: $calendar, other1: $messages, other2: $home, other3: $academics2 )
                    Button_Menu(text: $Academics, state: $academics2, other1: $messages, other2: $calendar, other3: $home )
                }
            }.offset(y: -30)
            
            
        }.padding(.top, 800)
        
        
    }
}

//Club page
struct ClubDescription2: View{
    @Binding var image: String
    @Binding var name: String
    @Binding var showDescription: Bool
    @Binding var state: Bool
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    var body: some View {
        
        
        Button{
            showDescription = true
            state = true
        } label: {
            
            ZStack {
                RoundedRectangle( cornerRadius: 20, style: .continuous)
                    .frame(width: width/1.1, height: height/10)
                    .foregroundColor(Color.white)
                
                HStack(spacing: 20){
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 80)
                        .cornerRadius(50)
                    
                    VStack(alignment: .leading)
                    {
                        Text(name)
                            .font(.title).bold()
                        
                        Text("Click For More")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                }
                .padding()
            }
            
        }
        
        
    }
}

//Club page
struct ClubDescription: View{
    @Binding var image: String
    @Binding var name: String
    @Binding var showDescription: Bool
    @Binding var state: Bool
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    var body: some View {
        
        
        Button{
            showDescription = true
            state = true
        } label: {
            
            ZStack {
                RoundedRectangle( cornerRadius: 20, style: .continuous)
                    .frame(width: width/1.1, height: height/10)
                    .foregroundColor(Color.white)
                
                HStack(spacing: 20){
                    AsyncImage(url: URL(string: image)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 80)
                            .cornerRadius(50)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                    VStack(alignment: .leading)
                    {
                        Text(name)
                            .font(.title).bold()
                        
                        Text("Click For More")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                }
                .padding()
            }
            
        }
        
        
    }
}


struct CustomShape: Shape {
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    func path(in rect: CGRect) -> Path {
        
        //        rect.setWidth = width
        //        rect.height = height
        
        return Path { path in
            path.addArc(center: CGPoint(x: rect.minX/2, y: rect.midY), radius: rect.height/4, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 270), clockwise: true)
            path.addRect(CGRect(x: 0, y: rect.minY, width: rect.width, height: 2*width))
            
        }
        
    }
}

struct Blur: UIViewRepresentable {
    
    var style: UIBlurEffect.Style = .systemMaterial
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context){
        uiView.effect = UIBlurEffect(style: style)
    }
    
}


struct LabelledDivider: View {
    
    let label: String
    let horizontalPadding: CGFloat
    let color: Color
    
    init(label: String, horizontalPadding: CGFloat = 5, color: Color = .gray) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }
    
    var body: some View {
        HStack {
            line
            line
            line
            line
        }
    }
    
    var line: some View {
        VStack { Divider().background(color).frame(maxHeight:20) }.padding(horizontalPadding)
    }
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .move(edge: .trailing).combined(with: .opacity)
        )
        
    }
    
    static var moveUp: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .bottom).combined(with: .opacity),
            removal: .move(edge: .bottom).combined(with: .opacity)
        )
        
    }
}


struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct exitPage: View {
    @Binding var showMenu: Bool
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    var body: some View {
        
        VisualEffectView(effect: UIBlurEffect(style: .dark))
            .opacity(0.5)
            .transition(.moveAndFade)
        
        ZStack{
            RoundedRectangle(cornerRadius: 10, style: .continuous).frame(width: width/1.8, height: height).foregroundColor(Color.white)
                .position(x: width/1.25, y: 400)
            
            ZStack{
                
                VStack{
                    HStack{
                        Image ("hot")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(y: 10)
                            .frame(width:60.0, height: 60.0, alignment: .center)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        VStack(spacing: 6){
                            Text("Julian Ng")
                                .foregroundColor(Color.green)
                                .bold()
                                .font(.system(size: 20)).multilineTextAlignment(.center)
                            
                            Text("Grade 11")
                                .foregroundColor(Color.green)
                                .bold()
                                .font(.system(size: 15)).multilineTextAlignment(.center)
                                .offset(y: -5)
                        }
                        
                    }
                    
                    HStack{
                        Button{
                            withAnimation(){
                                
                            }
                        } label:
                        {
                            ZStack{
                                
                                
                                HStack(spacing: 18){
                                    Image(systemName: "desktopcomputer")
                                        .resizable()
                                        .renderingMode(.template)
                                        .frame(width: 35, height: 35)
                                        .foregroundColor(Color.green)
                                    
                                    Text("Website")
                                        .foregroundColor(Color.green)
                                        .bold()
                                        .font(.system(size: 17)).multilineTextAlignment(.center)
                                }
                            }
                            
                        }
                        
                    }.offset(y: 40)
                    
                    HStack{
                        Button{
                            withAnimation(){
                                
                            }
                        } label:
                        {
                            ZStack{
                                
                                
                                HStack(spacing: 34){
                                    Image(systemName: "newspaper")
                                        .resizable()
                                        .renderingMode(.template)
                                        .frame(width: 35, height: 35)
                                        .foregroundColor(Color.green)
                                    
                                    Text("Epitah")
                                        .foregroundColor(Color.green)
                                        .bold()
                                        .font(.system(size: 17)).multilineTextAlignment(.center)
                                }
                            }
                            
                        }
                        
                    }.offset(y: 60)
                    
                    HStack{
                        Button{
                            withAnimation(){
                                
                            }
                        } label:
                        {
                            ZStack{
                                
                                
                                HStack(spacing: 12){
                                    Image("youtube")
                                        .resizable()
                                        .renderingMode(.template)
                                        .frame(width: 45, height: 45)
                                        .foregroundColor(Color.green)
                                    
                                    Text("YouTube")
                                        .foregroundColor(Color.green)
                                        .bold()
                                        .font(.system(size: 17)).multilineTextAlignment(.center)
                                }
                            }
                            
                        }
                        
                    }.offset(y: 80)
                    
                    HStack{
                        Button{
                            withAnimation(){
                                do {
                                    try Auth.auth().signOut();
                                } catch {
                                    print("Sign out error!")
                                }
                            }
                        } label:
                        {
                            ZStack{
                                
                                
                                HStack(spacing: 2){
                                    Image("signout")
                                        .resizable()
                                        .renderingMode(.template)
                                        .frame(width: 55, height: 55)
                                        .foregroundColor(Color.green)
                                    
                                    Text("Sign Out")
                                        .foregroundColor(Color.green)
                                        .bold()
                                        .font(.system(size: 17)).multilineTextAlignment(.center)
                                }
                            }
                            
                        }
                        
                    }.offset(y: 380)
                    
                }.offset(x: 100, y: -240)
            }
            
            
            
            
            
            Button{
                withAnimation(){
                    showMenu.toggle()
                }
            } label:
            {
                ZStack{
                    RoundedRectangle(cornerRadius: 10, style: .continuous).frame(width: 30, height: 30).foregroundColor(Color.black).opacity(0.75)
                    
                    
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .frame(width: 12, height: 20)
                        .rotationEffect(.degrees(-180))
                        .foregroundColor(Color.white)
                    
                }.offset(x: 5, y: -20)
                
            }
        }  .transition(.moveAndFade)
            .zIndex(2)
        
        
    }
}




//Button with resiable image and size
struct Button_Large: View{
    @Binding var text: String
    @Binding var state: Bool
    @Binding var image: String
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    var body: some View{
        Button{
            state = true
        } label: {
            
            ZStack{
                RoundedRectangle(cornerRadius:10)
//                    .stroke(Color.gray, lineWidth:1)
                    .fill(Color.gray).opacity(0.1)
                    .frame(width: width/2 - width/17, height:150)
                    .background(Color.white)
                
                VStack(spacing: 6){
                    Image(image)
                        .resizable().aspectRatio(contentMode: .fit).frame(width: 90, height: 90)
                    
                    Text(text)
                        .foregroundColor(state ? Color.green:Color.black)
                        .font(.system(size: 14)).bold().multilineTextAlignment(.center)
                        .offset(x: 0, y: 11)
                }
            }.offset(x: 5, y: -14)

                    
                    
                }.offset(x: 5, y: -14)
            }
            
        }
  
