//
//  Message.swift
//  HHS MAD 2023
//
//  Created by Julian NTH on 3/11/23.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
