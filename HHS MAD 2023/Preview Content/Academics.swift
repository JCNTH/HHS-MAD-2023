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
    
    private let defaults = UserDefaults.standard
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    @State var forumnpost = false
    
    @State private var TopImage = "math"
    
    /*
    @State var mathImage1 =
    @State var mathImage2 =
    @State var mathImage3 =
     
    @State var scienceImage1 =
    @State var scienceImage2 =
    @State var scienceImage3 =

     @State var ssImage1 =
     @State var ssImage2 =
     @State var ssImage3 =
      
     @State var otherImage1 =
     @State var otherImage2 =
     @State var otherImage3 =
     

     
     */
    
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
                Group {
                    
                    ZStack{
                        RoundedRectangle( cornerRadius: 13, style: .continuous)
                            .frame(width: width/1.2, height: height/20)
                        
                        HStack(spacing: 20){
                            Button_ (text: $Math, state: $math, other1: $science, other2: $socialstudies, other3: $other)
                            Button_ (text: $Science, state: $science, other1: $math, other2: $socialstudies, other3: $other)
                            Button_ (text: $SocialStudies, state: $socialstudies, other1: $math, other2: $science, other3: $other)
                            Button_ (text: $Other, state: $other, other1: $math, other2: $science, other3: $socialstudies)
                        }
                       
                    }
                    .padding()
                    .offset(x: 0, y:-(height/3 + height/30))

                }
                
                if (math){
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
                        
                        Text("Precalculus Honors")
                            .padding()
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .offset(x: 50, y: -260)
                            .foregroundColor(.white)
                        
                        
                        Text("Help Needed To Solve Derivative")
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
                        
                        Text("Algebra 2")
                            .padding()
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .offset(x: 50, y: -260)
                            .foregroundColor(.white)
                        
                        VStack{
                            Text("Logarithimic Function")
                            Text("Not Solving Properly")
                        }    .padding()
                            .font(.system(size: 13, design: .rounded))
                            .offset(x: 70, y: -230)
                            .foregroundColor(.white)
                        
                        Text("↑ -1 ↓")
                            .padding()
                            .font(.system(size: 32, design: .rounded))
                            .offset(x: 50, y: -200)
                            .foregroundColor(.white)
                        
                    }.offset(x:0, y: 260)
                }
                
                if (science){
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
                        
                        Text("AP Biology")
                            .padding()
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .offset(x: 50, y: -260)
                            .foregroundColor(.white)
                        
                        
                        Text("Not understanding concepts")
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
                        
                        Text("AP Physics 1")
                            .padding()
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .offset(x: 50, y: -260)
                            .foregroundColor(.white)
                        
                        
                        Text("Kinematics Problem    ")
                            .padding()
                            .font(.system(size: 13, design: .rounded))
                            .offset(x: 80, y: -240)
                            .foregroundColor(.white)
                        
                        Text("↑ 4 ↓")
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
                        
                        Text("Biology")
                            .padding()
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .offset(x: 50, y: -260)
                            .foregroundColor(.white)
                        
                        VStack{
                            Text("Need help understanding")
                            Text("mitochondria diagram")
                        }    .padding()
                            .font(.system(size: 13, design: .rounded))
                            .offset(x: 70, y: -240)
                            .foregroundColor(.white)
                        
                        Text("↑ -1 ↓")
                            .padding()
                            .font(.system(size: 32, design: .rounded))
                            .offset(x: 50, y: -200)
                            .foregroundColor(.white)
                        
                    }.offset(x:0, y: 260)
                }
                
                if (socialstudies){
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
                        
                        Text("APUSH")
                            .padding()
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .offset(x: 50, y: -260)
                            .foregroundColor(.white)
                        
                        
                        Text("War of 1812 Question")
                            .padding()
                            .font(.system(size: 13, design: .rounded))
                            .offset(x: 80, y: -240)
                            .foregroundColor(.white)
                        
                        Text("↑ 10 ↓")
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
                        
                        Text("World History")
                            .padding()
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .offset(x: 50, y: -260)
                            .foregroundColor(.white)
                        
                        
                        Text("World War Two Question")
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
                        
                        Text("American Studies")
                            .padding()
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .offset(x: 60, y: -260)
                            .foregroundColor(.white)
                        
                        
                        Text("Need help on research")
                            .padding()
                            .font(.system(size: 13, design: .rounded))
                            .offset(x: 70, y: -240)
                            .foregroundColor(.white)
                        
                        Text("↑ -11 ↓")
                            .padding()
                            .font(.system(size: 32, design: .rounded))
                            .offset(x: 50, y: -200)
                            .foregroundColor(.white)
                        
                    }.offset(x:0, y: 260)
                }
                
                if (other){
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
                        
                        Text("AP CS")
                            .padding()
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .offset(x: 40, y: -260)
                            .foregroundColor(.white)
                        
                        
                        Text("Recursion maze problem")
                            .padding()
                            .font(.system(size: 13, design: .rounded))
                            .offset(x: 80, y: -240)
                            .foregroundColor(.white)
                        
                        Text("↑ 13 ↓")
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
                        
                        Text("Principle of Business")
                            .padding()
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .offset(x: 60, y: -260)
                            .foregroundColor(.white)
                        
                        
                        Text("Leadership styles memorization")
                            .padding()
                            .font(.system(size: 12, design: .rounded))
                            .offset(x: 80, y: -240)
                            .foregroundColor(.white)
                        
                        Text("↑ 6 ↓")
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
                        
                        Text("Accounting")
                            .padding()
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .offset(x: 50, y: -260)
                            .foregroundColor(.white)
                        
                        Text("Checking account test help")
                            .padding()
                            .font(.system(size: 13, design: .rounded))
                            .offset(x: 80, y: -240)
                            .foregroundColor(.white)
                        
                        Text("↑ -16 ↓")
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
                    }
                
                    
                    
                //Top Post
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
        
        /*
        //Mesagges Page
        if(forumnpost)
        {
            EventPage()
                .padding(.top, height/10)
              
        }
         */
    }
}


struct Academics_Previews: PreviewProvider {
    static var previews: some View {
        Academics()
    }
}


