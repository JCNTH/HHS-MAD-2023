//
//  ForumnPage.swift
//  HHS MAD 2023
//
//  Created by Bhruv Dhargava on 6/22/23.
//

import SwiftUI

struct ForumnPage: View {
    var subject:String;
    var images:[String];
    @Binding var activeDiscussion:String

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    activeDiscussion = "none";
                }) {
                    Image(systemName: "arrow.backward")
                        .padding(.leading).scaleEffect(2)
                }
                Spacer()
            }

            Text(subject)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .fontWeight(.heavy)
                .padding(.bottom, -10.0)

            VStack{
                HStack {
                    Image(systemName: "arrowtriangle.left.fill")
                    Image (images[0])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    Image (images[1])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    Image(systemName: "arrowtriangle.right.fill")

                }
            }
            .padding()

        }.padding().background(Color(hue: 0.335, saturation: 0.189, brightness: 0.897))
    }
}
