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
    @State var FBLA_IMAGE = "https://scontent-sjc3-1.xx.fbcdn.net/v/t39.30808-6/290348585_5547688558576292_6336213932476525550_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=29cyXmZOzxAAX9nsFo8&_nc_ht=scontent-sjc3-1.xx&oh=00_AfABwXkw547iGSliH33qomo9mdS9IwnYQbVG_q4e2I4JZA&oe=64144BE9"
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
    
    //Screen Length & Width to adjust for different phone sizes
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height

    
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
                        
                        // Introductory Section
                        Group {
                            Text("Hello Julian")
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
                                    if(FBLA_STATE){
                                        RoundedRectangle( cornerRadius: 45, style: .continuous)
//                                            .ignoresSafeAreaEdges
                                            .foregroundColor(Color.white)
                                            .frame(width: width, height: height)
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
                        if(social){
                            ActivitiesPage()
                        }
                    }
                }
            }
            
            //Mesagges Page
            if(messages)
            {
                Messages()
                    .offset(y: height/15)
            }
            
            //Calendar page
            if(calendar)
            {
                CalendarPage()
            }
            
            
            //Forums Page
            if(academics2)
            {
                HHS_MAD_2023.Academics()
            }
            
            MenuScreen(home: $home, messages: $messages, calendar: $calendar, academics2: $academics2)
        }
    }
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
