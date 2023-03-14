//
//  ContentView.swift
//  HHS MAD 2023
//
//  Created by Dhruv B 3/11/23.
//


import SwiftUI


struct PhotoSharing: View {
    var body: some View {
        
       
        ZStack {
            //Background color
//            Color(red: 231/255, green: 255/255, blue: 231/255)
//                .ignoresSafeArea()
//
            // Top section
            Group {
//                // Introductory Section
                Group {
                    Text("Photo Sharing")
                        .padding()
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .offset(x: -60, y: -300)
                }
                
                
//                // Activities topic selector
//                Group {
//                    RoundedRectangle( cornerRadius: 13, style: .continuous)
//                        .frame(width: 320, height: 50)
//                        .offset(x: 0, y: -315)
//
//                    Text("Social     Clubs      Academics     Other")
//                        .padding()
//                        .font(.system(size: 15, design: .rounded))
//                        .offset(x: 0, y: -315)
//                        .foregroundColor(.white)
//
//                    RoundedRectangle( cornerRadius: 13, style: .continuous)
//                        .fill(.green)
//                        .frame(width: 50, height: 40)
//                        .offset(x: -105, y: -315)
//                        .opacity(0.5)
//
//                }
                
                Image ("ScrollBar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(10)
                    .frame(width: 300, height: 500)
                    .offset(x:-160, y:-130)
                
                Group {
                    Image ("Activity1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(width: 150, height: 250)
                        .offset(x:-94, y:65)
                    
                    Image ("Activity1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(width: 150, height: 250)
                        .offset(x:64, y:65)
                    
                    Image ("Activity1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(width: 150, height: 250)
                        .offset(x:-94, y:210)
                    
                    Image ("Activity1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(width: 150, height: 250)
                        .offset(x:64, y:210)
                    
                }.offset(x:45, y:-270)
                
            }
            
        }
    }
}


struct PhotoSharing_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSharing()
    }
}


