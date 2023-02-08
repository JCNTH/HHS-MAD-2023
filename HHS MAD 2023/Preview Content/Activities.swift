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
            Color(red: 231/255, green: 255/255, blue: 231/255)
                .ignoresSafeArea()
            
            Text("Hello Julian")

                .padding()
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .offset(x: -80, y: -330)
            
            Text("Have a nice day")

                .padding()
                .font(.system(size: 15, design: .rounded))
                .offset(x: -93, y: -300)
            
            Image ("hot")
           
                
        }
        
        
    }
}

struct Activities_Previews: PreviewProvider {
    static var previews: some View {
        Activities()
    }
}
