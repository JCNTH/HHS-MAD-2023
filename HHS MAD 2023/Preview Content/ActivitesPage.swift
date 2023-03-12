//
//  ContentView.swift
//  HHS MAD 2023
//
//  Created by Dhruv B 2/5/23.
//

import SwiftUI

struct ActivitiesPage: View {
    var body: some View {
        
       
        ZStack {
            //Background color
   
            
           
            
            //Middle Section
            Group {
                
                
                
                //Activites section
                Group {
                    Text("ACTIVITIES")
                        .padding()
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .offset(x: -110, y: -40)
                    
                    //Left Activity
                    Group {
                        RoundedRectangle( cornerRadius: 13, style: .continuous)
                            .frame(width: 170, height: 230)
                            .offset(x: -95, y: 100)
                        
                        Image ("Activity1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .frame(width: 150, height: 250)
                            .offset(x:-94, y:65)
                        
                        Text("2023 Spring Fling")
                            .padding()
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .offset(x: -110, y: 155)
                            .foregroundColor(.white)
                        
                        
                        Text("≡")
                            .padding()
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .offset(x: -156, y: 185)
                            .foregroundColor(.white)
                            
                        Text("LEARN MORE")
                            .padding()
                            .font(.system(size: 12, design: .rounded))
                            .offset(x: -102, y: 188)
                            .foregroundColor(.white)
                        
                    }
                    
                    //Right Activity
                    Group{
                        RoundedRectangle( cornerRadius: 13, style: .continuous)
                            .frame(width: 170, height: 230)
                            .offset(x: 95, y: 100)
                        
                        Image ("Activity2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .frame(width: 150, height: 250)
                            .offset(x:94, y:65)
                        
                        Text("BOTC Rally")
                            .padding()
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .offset(x: 60, y: 155)
                            .foregroundColor(.white)
                        
                        
                        Text("≡")
                            .padding()
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .offset(x: 36, y: 185)
                            .foregroundColor(.white)
                            
                        Text("LEARN MORE")
                            .padding()
                            .font(.system(size: 12, design: .rounded))
                            .offset(x: 92, y: 188)
                            .foregroundColor(.white)
                    }
                }
                   
                //Epitaph Section
                Group{
                    Text("EPITAPH")
                        .padding()
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .offset(x: -120, y: 240)
                    
                    RoundedRectangle( cornerRadius: 13, style: .continuous)
                        .frame(width: 360, height: 50)
                        .offset(x: 0, y: 290)
                    
                }
                
                
            }
            
                
        }
        
        
    }
}

struct ActivitiesPage_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesPage()
    }
}
