//
//  CalendarUI.swift
//  HHS MAD 2023
//
//  Created by Julian NTH on 2/7/23.
//

import SwiftUI

struct Calendar: View {
    var body: some View {
        VStack{
            Day(date:"Mon 11", events:[])
            Day(date:"Tues 12", events:[])
            Day(date:"Wed 13", events:[])
            Day(date:"Thurs 14", events:[])
            Day(date:"Fri 15", events:[])
        }.scaleEffect(x:0.8, y:0.8)
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Calendar()
    }
}

extension Calendar {
    
}
