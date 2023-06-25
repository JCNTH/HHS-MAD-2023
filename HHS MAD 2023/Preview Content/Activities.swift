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
    
    @State var calendarVM = CalendarPageViewModel();
    
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

    @State var activitiesCurrent = ActivityManager()
    
    @State private var currentIndex = 0
    let images = ["homestead1", "homestead2", "homestead3"]
    
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
                                print ("Appear")
                                
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
                                .padding(.top, height/2.4)
                        }
                        
                        //Clubs Page
                        if(clubs){
                            ZStack {
                                VStack{
                                    ScrollView{
                                        ClubDescription(image: $FBLA_IMAGE, name: $FBLA_NAME, showDescription: $showDescription, state: $FBLA_STATE)
                                        ClubDescription(image: $ROBOTICS_IMAGE, name: $ROBOTICS_NAME, showDescription: $showDescription, state: $ROBOTICS_STATE)
                                        ClubDescription(image: $CHESS_IMAGE, name: $CHESS_NAME, showDescription: $showDescription, state: $CHESS_STATE)
                                        ClubDescription(image: $SHOGI_IMAGE, name: $SHOGI_NAME, showDescription: $showDescription, state: $SHOGI_STATE)
                                        ClubDescription(image: $DATA_IMAGE, name: $DATA_NAME, showDescription: $showDescription, state: $DATA_STATE)

                                    }
                                    
                                }.padding(.top, height/1.9)
                                
                                if(showDescription)
                                {
                                    //If "FBLA" club is selected
                                    if(FBLA_STATE){
                                            ZStack{
                                                //FBLA club description
                                                ScrollView{
                                                    Button{
                                                      FBLA_STATE = false
                                                    showDescription = false
                                                    } label: {
                                                        Image(systemName: "xmark")
                                                            .resizable()
                                                            .frame(width: 20, height: 20)

                                                        
                                            
                                                    }.offset(x: -width/3, y: height/20)
                                                      
                                                    
                                                    VStack(alignment: .center, spacing: 20){
                                                    
                                                        AsyncImage(url: URL(string: FBLA_IMAGE)) { image in
                                                            image.resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                .frame(width: 100, height: 80)
                                                                .cornerRadius(50)

                                                        } placeholder: {
                                                            ProgressView()
                                                        }
                                                        
                                                        
                                                        
                                                        Text("FBLA")
                                                            .font(.largeTitle).bold()
                                                            .foregroundColor(Color.green)
                                                        Text("Meetings: Monthly")
                                                            .font(.system(size: 20, weight: .bold, design: .default))
                                                        Text("Membership: Try-Out Based")
                                                            .font(.system(size: 20, weight: .bold, design: .default))
        //                                                padding()
                                                        
                                                        Text("About The Club")
                                                            .foregroundColor(Color.blue)
                                                            .font(.system(size: 30, weight: .bold, design: .default))
                                                            .frame(width: 1000, height: 60)
                                                        
                                                        Text("Homestead FBLA currently has 4 projects. The projects consist of the American Enterprise Project, the Community Service Project, the Partnership with Business Project, and the Software Ventures Project.")
                                                            .fixedSize(horizontal: false, vertical: true)
                                                            .font(.system(size: 18, weight: .bold, design: .default))
                                                            .multilineTextAlignment(.center)

//                                                        Spacer()

                                                        Text("Achievements")
                                                            .foregroundColor(Color.blue)
                                                            .font(.system(size: 30, weight: .bold, design: .default))
                                                            .frame(width: 1000, height: 60)
                                                        
                                                        Text("23 Bay Section Championships")
                                                            .font(.system(size: 18, weight: .bold, design: .default))

                                                        Text("21 State Championships")
                                                            .font(.system(size: 18, weight: .bold, design: .default))

                                                        Text("20 National Championships")
                                                            .font(.system(size: 18, weight: .bold, design: .default))

                                                    }.padding(.top, height/10).frame(width: UIScreen.main.bounds.width/1.4, height: 500).offset(y: 80)
                                                   
                                                }.frame(width: width/1.2, height: height/1.2)
                                                .background(Rectangle().fill(Color.white).shadow(radius: 3).frame(width: width/1.2, height: height/1.2))

                                               

                                                

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
                if (!(calendarVM.activeEventID == "")) {
                    Text("Hello World")
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

struct Activities_Previews: PreviewProvider {
    static var previews: some View {
        Activities(name: "Julian NTH")
    }
}

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
                VStack(spacing: 6){
                    Image(image)
                        .resizable().aspectRatio(contentMode: .fit).frame(width: 90, height: 90)
                        .foregroundColor(state ? Color.white:Color.black)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous).fill(state ? Color.green:Color.gray)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 10, style: .continuous).fill(state ? Color.green:Color.white)

                            )
                            .frame(width: 115, height: 105))

                    Text(text)
                        .foregroundColor(state ? Color.green:Color.black)
                        .font(.system(size: 14)).bold().multilineTextAlignment(.center)
                        .offset(x: 0, y: 11)


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
            RoundedRectangle(cornerRadius: 10, style: .continuous).frame(width: width/2.5, height: height).foregroundColor(Color.green)
                .position(x: 330, y: 400)
            
            ZStack{
                
           
                
                HStack{
                    
                    Button{
                        withAnimation(){
                            
                        }
                           } label:
                           {
                              
                               
                               Image("signout")
                                   .background(RoundedRectangle(cornerRadius: 0, style: .continuous).frame(width: width/2.5, height: height/15).foregroundColor(Color.gray))
                               
                               Text("Sign Out")
                                   .foregroundColor(Color("Green"))
                                   .font(.system(size: 14)).multilineTextAlignment(.center)
                           }
                }
            }.position(x: 330, y: 130)
     
              
            
           
        }  .transition(.moveAndFade)
            .zIndex(2)

        
    }
}
