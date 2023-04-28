//
//  ContentView.swift
//  HHS MAD 2023
//
//  Created by Dhruv B 2/5/23.
//

import SwiftUI

struct Activities: View {
    
    //Boolean variables for activities page
    @State var photos = false
    @State var events = false
    @State var clubs = false
    @State var social = true
    
    @State var activeEvent = "none";
    
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
    
    //Clubs
    @State var FBLA_IMAGE = "data:image/jpeg;base64,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"
    @State var FBLA_NAME = "FBLA"
    @State var FBLA_STATE = false
    @State var ROBOTICS_IMAGE = "https://homesteadrobotics.com/wp-content/uploads/2019/11/Logo-no-words-300x219.png"
    @State var ROBOTICS_NAME = "Robotics"
    @State var ROBOTICS_STATE = false
    @State var CHESS_IMAGE = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/25d45014-8cc3-4c98-b02c-5a0cf3a55ddd/dcpnfcn-aa852171-725a-400f-b837-b2d6774fdf4d.png/v1/fill/w_900,h_900,strp/chess_piece_king_on_transparent_background__by_prussiaart_dcpnfcn-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTAwIiwicGF0aCI6IlwvZlwvMjVkNDUwMTQtOGNjMy00Yzk4LWIwMmMtNWEwY2YzYTU1ZGRkXC9kY3BuZmNuLWFhODUyMTcxLTcyNWEtNDAwZi1iODM3LWIyZDY3NzRmZGY0ZC5wbmciLCJ3aWR0aCI6Ijw9OTAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.tObnyucxyQbSjiS7OYRvhS9hwwZiy5HCrTaQWBIhIQM"
    @State var CHESS_NAME = "Chess"
    @State var CHESS_STATE = false
    @State var SHOGI_IMAGE = "https://thumb.ac-illust.com/71/712219560b878987046a1452d98051b1_t.jpeg"
    @State var SHOGI_NAME = "Shogi"
    @State var SHOGI_STATE = false
    @State var DATA_IMAGE = "https://png.pngtree.com/element_our/20190603/ourlarge/pngtree-data-analysis-cartoon-illustration-image_1430283.jpg"
    @State var DATA_NAME = "Data Analysis"
    @State var DATA_STATE = false
    
    @State var showDescription = false
    private let defaults = UserDefaults.standard
    
    //Screen Length & Width to adjust for different phone sizes
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height

    @State var name = "Julian"
    @State var activitiesCurrent = ActivityManager()
    
    var body: some View {
        ZStack{
            //Start page, home page
            if (home) {
                ZStack {
                    //Background color
                    Color(red: 231/255, green: 255/255, blue: 231/255)
                        .ignoresSafeArea()
                 
                    // Top section
                    Group {
                        
                        // Introductory Section.
                        // Creates the profile picture of the user and also displays the user's name.
                        // Additional information is displayed such as the current weather at the school.
                        // as well as a picture.
                        Group {
                            Text("Hello " + name)
                                .padding()
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                                .offset(x: -width/4.8, y: -360)
                                
                            Text("Have a Nice Day")
                                .padding()
                                .font(.system(size: 15, design: .rounded))
                                .offset(x: -width/4.2, y: -330)
                            
                            Image ("hot")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width:80.0, height: 80.0, alignment: .center)
                                .offset(x:width/3.3, y: -355)
                        }
                        
                        //School image and weather section
                        Group {
                            Image ("school")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(10)
                                .frame(width: width/1.2, height: height/9)
                                .offset(x:0, y:-220)
                            
                            Text("64° F ⛅")
                                .padding()
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .offset(x: -width/3.3, y: -height/5)
                                .foregroundColor(.white)
                        }
                        
                    }
                    
                    //Middle Section
                    Group {
                        
                        // Activities topic selector
                        Group {
                            
                            ZStack{
                                RoundedRectangle( cornerRadius: 13, style: .continuous)
                                    .frame(width: width/1.2, height: height/20)
                                
                                HStack(spacing: 20){
                                    Button_(text: $Social, state: $social, other1: $events, other2: $clubs, other3: $photos)
                                    Button_(text: $Events, state: $events, other1: $social, other2: $clubs, other3: $photos)
                                    Button_(text: $Clubs, state: $clubs, other1: $events, other2: $social, other3: $photos)
                                    Button_(text: $Photos, state: $photos, other1: $events, other2: $clubs, other3: $social)
                                    
                               
                            }
                               
                            }
                            .padding(.bottom, height/5)
                        }
                        
                        
                        //Photos Page
                        if(photos){
                            PhotoSharing()
                                .padding(.top, height/1.4)
                        }
                        
                        //Events Page
                        if(events){
                            CalendarUI(numDates: 5)
                                .padding(.top, height/2.8)
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
                                    
                                }.padding(.top, height/2)
                                
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
                if (!self.activeEvent.elementsEqual("none")) {
                    EventPage(eventName:"CASSPP", time:"7 AM", date:"1/1/23", location:"L103", description:"Required for Juniors. Statewide testing to monitor high school learning progress.", activeEvent: $activeEvent)
                } else {
//                    CalendarPage(activeEvent: $activeEvent)
                }
            }
            
            
            
            //Forums Page
            if(academics2)
            {
                HHS_MAD_2023.Academics()
            }
            
           
            
            MenuScreen(home: $home, messages: $messages, calendar: $calendar, academics2: $academics2)
            
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
                Image("MAD-LOGO-TRANSPARENT")
                    .resizable()
                    .frame(width: 70, height: 75)
                    .foregroundColor(Color(red: 231/255, green: 255/255, blue: 231/255))
                    .offset(y: -65)

            }.offset(y: 400)

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
        Activities()
    }
}

//Button structure. Used for making the buttons of app.
struct Button_: View{
    @Binding var text: String
    @Binding var state: Bool
    @Binding var other1: Bool
    @Binding var other2: Bool
    @Binding var other3: Bool
    
    var body: some View{
        Button{
            state = true
            other1 = false
            other2 = false
            other3 = false
        } label: {
            
            ZStack{
                Text(text)
                    .foregroundColor(state ? Color.green:Color.white)
                    
                   
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
                    .frame(width: 370, height: 100)
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
