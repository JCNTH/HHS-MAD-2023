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
    @State var history = false
    @State var other = false
    @State var language = false
    @State var literature = false
    @State var cs = false
    @State var design = false

    @State var activeDiscussion = "none";

    //Text variables
    @State var Math = "Math"
    @State var Science = "Science"
    @State var History = "History"
    @State var Other = "Other"
    @State var Language = "Language"
    @State var Literature = "Literature"
    @State var CS = "CS"
    @State var Design = "Design"
    

    @State var currentSubject = "Math";

    @State var MathImage = "Math-Icon"
    @State var ScienceImage = "Science-Icon"
    @State var HistoryImage = "Map-Icon"
    @State var OtherImage = "Other-Icon"
    @State var LanguageImage = "Language-Icon"
    @State var LiteratureImage = "History-Icon"
    @State var CSImage = "Computer-Icon"
    @State var DesignImage = "Design-Icon"

    private let defaults = UserDefaults.standard

    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height

    @State var forumnpost = false

    @State private var TopImage = "math"
    
    @State var state1 = true;
    @State var state2 = false;
    @State var state3 = false;
    @State var state4 = false;

    var body: some View {
        if (math){
            ForumPage(subject: "Math Forums", menu: ["Algebra", "Calculus", "Geometry", "Statistics"], state:[state1, state2, state3, state4], active: math)
        } else if (science){
            ForumPage(subject: "Science Forums", menu: ["Biology", "Chemistry", "Physics", "Earth"], state:[state1, state2, state3, state4], active: science)
        } else if (history){
            ForumPage(subject: "History Forums", menu: ["USH", "World", "Econ", "Gov"], state:[state1, state2, state3, state4], active: history)
        } else if (language){
            ForumPage(subject: "Language Forums", menu: ["Spanish", "French", "Japanese", "Other"], state:[state1, state2, state3, state4], active: language)
        } else if (literature){
            ForumPage(subject: "Literature Forums", menu: ["Reading", "Poetry", "Japanese", "Analyze"], state:[state1, state2, state3, state4], active: literature)
        } else if (cs){
            ForumPage(subject: "CS Forums", menu: ["Java", "Python", "Csharp", "JS"], state:[state1, state2, state3, state4], active: cs)
        } else if (design){
            ForumPage(subject: "Design Forums", menu: ["Art", "Ceramics", "Modeling", "Photography"], state:[state1, state2, state3, state4], active: design)
        }else {
            ZStack {
                //Background color
                Color(red: 255/255, green: 255/255, blue: 255/255)
                    .ignoresSafeArea()
                
                // Top sectionlike
                Group {
                    // Introductory Section
                    Group {
                        Text("Academic Forums")
                            .padding()
                            .font(.system(size: 30, weight: .bold, design:.rounded))
                            .offset(x: 0, y: -5*height/12)
                    }
                    
                    
                    // Activities topic selector
                    Group {
                        
                        VStack(spacing: 45){
                            HStack(spacing: 80){
                                Button_Large (text: $Math, state: $math, image: $MathImage)
                                Button_Large (text: $Science, state: $science, image: $ScienceImage)
                            }
                            
                            HStack(spacing: 80){
                                Button_Large (text: $History, state: $history,  image: $HistoryImage)
                                Button_Large (text: $Literature, state: $literature,  image: $LiteratureImage)
                            }
                            
                            HStack(spacing: 80){
                                Button_Large (text: $CS, state: $cs,  image: $CSImage)
                                Button_Large (text: $Language, state: $language,  image: $LanguageImage)
                            }
                            
                            HStack(spacing: 80){
                                Button_Large (text: $Design, state: $design,  image: $DesignImage)
                                Button_Large (text: $Other, state: $other,  image: $OtherImage)
                            }
                            
                        }
                        .padding()
                        .offset(x: 0, y:0)
                    }
                }
                
                
            }
            
        }
        
        
        
        if (forumnpost){
            Color(red: 231/255, green: 255/255, blue: 231/255)
                .ignoresSafeArea()
            
            Text("Calculus BC")
                .padding()
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .offset(x: 0, y: -355)
            
            Image ("Homework")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 4))
                .frame(width: width-width/10, height: 300)
                .offset(x:0, y:-220)
            
            ScrollView{
                VStack {
                    HStack (spacing: 12){
                        Image("DefaultProfile")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .offset(x:0, y:0)
                        
                        Text("You messed up on simplifying the expression in the fourth line, I suggest reviewing the solution on CalcChat to assist you in completing this problem." )
                            .padding()
                            .font(.system(size: 17, design: .rounded))
                    }.offset(x: 10, y: 0)
                    
                    HStack (spacing: 12){
                        Image("DefaultProfile")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .offset(x:0, y:0)
                        
                        Text("We did a similar problem in the notes in chapter 4, section 3, you can look at how we solved it then, and apply the same concepts to solve it now. ")
                            .padding()
                            .font(.system(size: 17, design: .rounded))
                    }.offset(x: 10, y: 0)
                    
                    HStack (spacing: 12){
                        Image("DefaultProfile")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .offset(x:0, y:0)
                            
                        Text("I think that you messed up on a couple of simplifications; this is probably because you skipped over steps when solving your work, I suggest you make sure to right out every step to ensure that you don't make any mistakes.")
                            .padding()
                            .font(.system(size: 17, design: .rounded))
                    }.offset(x: 10, y: 0)
                        
                    HStack (spacing: 12){
                        Image("DefaultProfile")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .offset(x:0, y:0)
                        
                        Text("This concept is covered in chapter 4, section 3, just review the notes for that section and then possibly check calcchat.")
                            .padding()
                            .font(.system(size: 17, design: .rounded))
                    } .offset(x: 10, y: 0)
                        
                        HStack (spacing: 12){
                            Image("DefaultProfile")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .offset(x:0, y:0)
                            
                            Text("You messed up your work in line 5.")
                                .padding()
                                .font(.system(size: 17, design: .rounded))
                        }.offset(x: 10, y: 0)
                    
                    HStack (spacing: 12){
                        Image("DefaultProfile")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .offset(x:0, y:0)
                        
                        Text("You should review 2-3, it has similar concepts to that in the problem.")
                            .padding()
                            .font(.system(size: 17, design: .rounded))
                    }.offset(x: 10, y: 0)
                }
                
                
            } .offset(x:0, y:height/2 - height/15)
        }
        
    }
}

//Button structure. Used for making the buttons of app.


struct Academics_Previews: PreviewProvider {
    static var previews: some View {
        Academics()
    }
}
