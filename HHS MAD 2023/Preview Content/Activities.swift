//
//  ContentView.swift
//  HHS MAD 2023
//
//  Created by Dhruv B 2/5/23.
//

import SwiftUI

struct Activities: View {
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
                    
                    Text("Have a nice day")
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
                
                // Activities topic selector
                Group {
                    RoundedRectangle( cornerRadius: 13, style: .continuous)
                        .frame(width: 360, height: 50)
                        .offset(x: 0, y: -90)
                    
                    Text("Academics     Events      Social      Clubs")
                        .padding()
                        .font(.system(size: 15, design: .rounded))
                        .offset(x: 0, y: -90)
                        .foregroundColor(.white)
                    
                    RoundedRectangle( cornerRadius: 13, style: .continuous)
                        .fill(.green)
                        .frame(width: 65, height: 40)
                        .offset(x: 48, y: -90)
                        .opacity(0.5)
                    
                }
                
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

struct Activities_Previews: PreviewProvider {
    static var previews: some View {
        Activities()
    }
}
