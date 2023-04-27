//
//  ContentView.swift
//  HHS MAD 2023
//
//  Created by Dhruv B 3/11/23.
//


import SwiftUI


struct Academics: View {
    
    //Boolean variables for activities page
    @State var math = false
    @State var science = false
    @State var socialstudies = false
    @State var other = true
    
    @State var activeEvent = "none";
    
    //Text variables
    @State var Math = "Math"
    @State var Science = "Science"
    @State var SocialStudies = "Social Studies"
    @State var Other = "Other"
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    var body: some View {
        
       
        ZStack {
            //Background color
            Color(red: 231/255, green: 255/255, blue: 231/255)
                .ignoresSafeArea()
            
            // Top sectionlike
            Group {
                // Introductory Section
                Group {
                    Text("Academics")
                        .padding()
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .offset(x: -85, y: -365)
                }
                
                
                // Activities topic selector
                let activitiesTopicSelector = ZStack {
                    RoundedRectangle( cornerRadius: 13, style: .continuous)
                        .frame(width: width/1.2, height: height/20)
                    
                    HStack(spacing: 20){
                        Button_(text: $Math, state: $math, other1: $science, other2: $socialstudies, other3: $other)
                        Button_(text: $Science, state: $science, other1: $math, other2: $socialstudies, other3: $other)
                        Button_(text: $SocialStudies, state: $socialstudies, other1: $math, other2: $science, other3: $other)
                        Button_(text: $Other, state: $other, other1: $math, other2: $science, other3: $socialstudies)
                    }
                }
                
                
                //Top Post
                Group {
                    RoundedRectangle( cornerRadius: 13, style: .continuous)
                        .frame(width: 360, height: 120)
                        .offset(x: 0, y: -220)
                    
                    Image ("Homework")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(width: 150, height: 120)
                        .offset(x:-94, y:-220)
                    
                    Text("AP Calculus BC")
                        .padding()
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .offset(x: 50, y: -260)
                        .foregroundColor(.white)
                    
                    
                    Text("Need help on solving integral")
                        .padding()
                        .font(.system(size: 13, design: .rounded))
                        .offset(x: 80, y: -240)
                        .foregroundColor(.white)
                        
                    Text("↑ 5 ↓")
                        .padding()
                        .font(.system(size: 32, design: .rounded))
                        .offset(x: 50, y: -200)
                        .foregroundColor(.white)
                    
                }
                
                //Middle Post
                Group {
                    RoundedRectangle( cornerRadius: 13, style: .continuous)
                        .frame(width: 360, height: 120)
                        .offset(x: 0, y: -220)
                    
                    Image ("Homework")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(width: 150, height: 120)
                        .offset(x:-94, y:-220)
                    
                    Text("AP Calculus BC")
                        .padding()
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .offset(x: 50, y: -260)
                        .foregroundColor(.white)
                    
                    
                    Text("Need help on solving integral")
                        .padding()
                        .font(.system(size: 13, design: .rounded))
                        .offset(x: 80, y: -240)
                        .foregroundColor(.white)
                        
                    Text("↑ 3 ↓")
                        .padding()
                        .font(.system(size: 32, design: .rounded))
                        .offset(x: 50, y: -200)
                        .foregroundColor(.white)
                    
                }.offset(x:0, y: 130)
                
                //Bottom Post
                Group {
                    RoundedRectangle( cornerRadius: 13, style: .continuous)
                        .frame(width: 360, height: 120)
                        .offset(x: 0, y: -220)
                    
                    Image ("Homework")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(width: 150, height: 120)
                        .offset(x:-94, y:-220)
                    
                    Text("AP Calculus BC")
                        .padding()
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .offset(x: 50, y: -260)
                        .foregroundColor(.white)
                    
                    
                    Text("Need help on solving integral")
                        .padding()
                        .font(.system(size: 13, design: .rounded))
                        .offset(x: 80, y: -240)
                        .foregroundColor(.white)
                        
                    Text("↑ -1 ↓")
                        .padding()
                        .font(.system(size: 32, design: .rounded))
                        .offset(x: 50, y: -200)
                        .foregroundColor(.white)
                    
                }.offset(x:0, y: 260)
            }
            
            //Information Section
            Group {
                  
                Group{
                    Text("Information")
                        .padding()
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .offset(x: -100, y: 125)
                    
                    Text("Show more ▼")
                        .padding()
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .offset(x: -0, y: 325)
                }
                
                Group {
                    RoundedRectangle( cornerRadius: 13, style: .continuous)
                        .frame(width: 170, height: 160)
                        .offset(x: -95, y: 100)
                    
                    Text("SAT Tutoring")
                        .padding()
                        .font(.system(size: 17, weight: .bold, design: .rounded))
                        .offset(x: -95, y: 40)
                        .foregroundColor(.white)
                    
                    VStack{
                        Text("SAT tutoring takes place")
                        Text("3/17 - 3/21 from 5 to 8")
                        Text("P.M. in room A107 and ")
                        Text("C203. Only Sophomores, ")
                        Text("Juniors, and Seniors. ")
                    }.padding()
                        .font(.system(size: 14, design: .rounded))
                        .offset(x: -95, y: 95)
                        .foregroundColor(.white)
                        
                    
                    Text("≡")
                        .padding()
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .offset(x: -150, y: 155)
                        .foregroundColor(.white)
                        
                    Text("LEARN MORE")
                        .padding()
                        .font(.system(size: 12, design: .rounded))
                        .offset(x: -90, y: 157)
                        .foregroundColor(.white)
                    
                }.offset(x:0, y:125)
                
                Group {
                    RoundedRectangle( cornerRadius: 13, style: .continuous)
                        .frame(width: 170, height: 160)
                        .offset(x: -95, y: 100)
                    
                    Text("PSAT Tutoring")
                        .padding()
                        .font(.system(size: 17, weight: .bold, design: .rounded))
                        .offset(x: -95, y: 40)
                        .foregroundColor(.white)
                    
                    VStack{
                        Text("PSAT tutoring takes place")
                        Text("3/17 - 3/21 from 5 to 8")
                        Text("P.M. in room C104 and ")
                        Text("C205. Only Sophomores, ")
                        Text("and Juniors.")
                    }.padding()
                        .font(.system(size: 14, design: .rounded))
                        .offset(x: -95, y: 95)
                        .foregroundColor(.white)
                        
                    
                    Text("≡")
                        .padding()
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .offset(x: -150, y: 155)
                        .foregroundColor(.white)
                        
                    Text("LEARN MORE")
                        .padding()
                        .font(.system(size: 12, design: .rounded))
                        .offset(x: -90, y: 157)
                        .foregroundColor(.white)
                    
                }.offset(x:190, y:125)
            }
            
                
        }
        
        
    }
}


struct Academics_Previews: PreviewProvider {
    static var previews: some View {
        Academics()
    }
}


