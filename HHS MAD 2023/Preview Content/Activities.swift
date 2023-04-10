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
    @State var FBLA_IMAGE = "https://scontent-sjc3-1.xx.fbcdn.net/v/t39.30808-6/290348585_5547688558576292_6336213932476525550_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=RehMbmD__j0AX_fpL8A&_nc_ht=scontent-sjc3-1.xx&oh=00_AfDGV4rZQLn9p06ZdY_OCJxwutY1PJWEyfadEjtD0IhtDQ&oe=6437E469"
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
                                    
                                }.padding(.top, height/2.1)
                                
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
                    .padding(.top, height/15)
                  
            }
            
            //Calendar page
            if (calendar) {
                if (!self.activeEvent.elementsEqual("none")) {
                    EventPage(eventName:"CASSPP", time:"7 AM", date:"1/1/23", location:"L103", description:"Required for Juniors. Statewide testing to monitor high school learning progress.", activeEvent: $activeEvent)
                } else {
                    CalendarPage(activeEvent: $activeEvent)
                }
            }
            
            
            
            //Forums Page
            if(academics2)
            {
                HHS_MAD_2023.Academics()
            }
            
            MenuScreen(home: $home, messages: $messages, calendar: $calendar, academics2: $academics2)
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
        Button{
            state = true
            other1 = false
            other2 = false
            other3 = false
        } label: {
            
            ZStack{
                Image(systemName: text)
                    .resizable()
                    .frame(width: 45, height: 40)
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
    @State var Home = "house.fill"
    @State var Messages = "message.fill"
    @State var Calendar = "calendar"
    @State var Academics = "book.fill"
    
    var body: some View{
        
        ZStack{
            RoundedRectangle( cornerRadius: 45, style: .continuous)
                .frame(width: 400, height: 100)
            
            HStack(spacing: 30){
                Button_Menu(text: $Home, state: $home, other1: $messages, other2: $calendar, other3: $academics2 )
                Button_Menu(text: $Messages, state: $messages, other1: $home, other2: $calendar, other3: $academics2 )
                Button_Menu(text: $Calendar, state: $calendar, other1: $messages, other2: $home, other3: $academics2 )
                Button_Menu(text: $Academics, state: $academics2, other1: $messages, other2: $calendar, other3: $home )
            }.offset(y: -20)
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

