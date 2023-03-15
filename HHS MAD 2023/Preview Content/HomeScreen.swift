//
//  HomeScreen.swift
//  HHS MAD 2023
//
//  Created by Julian NTH on 2/7/23.
//

import SwiftUI


struct HomeScreen: View {
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    var body: some View {
        
        GeometryReader{ geo in  
            
            
            ZStack{
                Color(red: 231/255, green: 255/255, blue: 231/255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
//                    RoundedRectangle(cornerRadius: 100, style: .continuous)
//                        .fill(Color.white)
//                        .frame(width: width/2, height: height/4)
                    
                    Image("MAD-LOGO-TRANSPARENT")
                    HStack{
                        
                    }
                }
                
//                Image("HHS_LOGO")
//                    .renderingMode(.original)
//                    .resizable()
//                    .frame(width: width/1.4, height: height/4, alignment: .center)
                    
                
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
