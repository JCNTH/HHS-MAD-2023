//
//  ContentView.swift
//  HHS MAD 2023
//
//  Created by Dhruv B 2/5/23.
//

import SwiftUI

struct Activities: View {
    @State var academics = false
    @State var events = false
    @State var clubs = false
    @State var social = true
    @State var Social = "Social"
    @State var Clubs = "Clubs"
    @State var Academics = "Academics"
    @State var Events = "Events"

    
    var body: some View {
        
       
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
                        .offset(x: -80, y: -360)
                    
                    Text("Have a Nice Day")
                        .padding()
                        .font(.system(size: 15, design: .rounded))
                        .offset(x: -93, y: -330)
                    
                    Image ("hot")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width:80.0, height: 80.0, alignment: .center)
                        .offset(x:100, y: -355)
                }
                
                //School image and weather section
                Group {
                    Image ("school")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(10)
                        .frame(width: 350, height: 160)
                        .offset(x:0, y:-220)
                    
                    Text("64° F ⛅")
                        .padding()
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .offset(x: -115, y: -151)
                        .foregroundColor(.white)
                }
                
            }
            
            //Middle Section
            Group {
                
                
                
                
                VStack{
                    
                }
                // Activities topic selector
                Group {
                    
                    ZStack{
                        RoundedRectangle( cornerRadius: 13, style: .continuous)
                            .frame(width: 360, height: 50)
                        
                        HStack(spacing: 20){
                            Button_(text: $Social, state: $social, other1: $events, other2: $clubs, other3: $academics)
                            Button_(text: $Events, state: $events, other1: $social, other2: $clubs, other3: $academics)
                            Button_(text: $Clubs, state: $clubs, other1: $events, other2: $social, other3: $academics)
                            Button_(text: $Academics, state: $academics, other1: $events, other2: $clubs, other3: $social)
                            
                       
                    }
                       
                    }
                    .padding(.bottom, 180)
                }
                
                
                // Actual info
                if(academics){
                    
                }
                
                if(events){
                    CalendarUI(numDates: 5)
                        .padding(.top, 300)
                }
                    
                if(clubs){
                    
                }
                    
                if(social){
                    ActivitiesPage()
                }
                
                
                
                MenuScreen()
                    
            }
            
                
        }
        
        
    }
    
    func resetValues()
    {
        academics = false
        events = false
        clubs = false
        social = false
    }
}

struct Activities_Previews: PreviewProvider {
    static var previews: some View {
        Activities()
    }
}


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

struct MenuScreen: View{
    @State var home = true
    @State var messages = false
    @State var calendar = false
    @State var academics = false
    @State var Home = "house.fill"
    @State var Messages = "message.fill"
    @State var Calendar = "calendar"
    @State var Academics = "book.fill"
    
    var body: some View{
        
        ZStack{
            RoundedRectangle( cornerRadius: 45, style: .continuous)
                .frame(width: 400, height: 100)
            
            HStack(spacing: 30){
                Button_Menu(text: $Home, state: $home, other1: $messages, other2: $calendar, other3: $academics )
                Button_Menu(text: $Messages, state: $messages, other1: $home, other2: $calendar, other3: $academics )
                Button_Menu(text: $Calendar, state: $calendar, other1: $messages, other2: $home, other3: $academics )
                Button_Menu(text: $Academics, state: $academics, other1: $messages, other2: $calendar, other3: $home )
            }.offset(y: -20)
        }.padding(.top, 800)
        
          
            
            
                

        }
    }
