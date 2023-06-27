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
//                        Text("Academic Forums")
//                            .padding()
//                            .font(.system(size: 30, weight: .bold, design:.rounded))
//                            .offset(x: 0, y: -5*height/12)
                    }
                    
                    
                    // Activities topic selector
                    Group {
                        
                        VStack(spacing: 15){
                            HStack(spacing: 20){
                                Button_Large (text: $Math, state: $math, image: $MathImage)
                                Button_Large (text: $Science, state: $science, image: $ScienceImage)
                            }
                            
                            HStack(spacing: 20){
                                Button_Large (text: $History, state: $history,  image: $HistoryImage)
                                Button_Large (text: $Literature, state: $literature,  image: $LiteratureImage)
                            }
                            
                            HStack(spacing: 20){
                                Button_Large (text: $CS, state: $cs,  image: $CSImage)
                                Button_Large (text: $Language, state: $language,  image: $LanguageImage)
                            }
                            
                            HStack(spacing: 20){
                                Button_Large (text: $Design, state: $design,  image: $DesignImage)
                                Button_Large (text: $Other, state: $other,  image: $OtherImage)
                            }
                            
                        }
                        .padding()
                        .offset(x: -5, y:-20)
                    }
                }
                
                
            }
            
        }
        
        
        
        if (forumnpost){
            
        }
        
    }
}

//Button structure. Used for making the buttons of app.


struct Academics_Previews: PreviewProvider {
    static var previews: some View {
        Academics()
    }
}
