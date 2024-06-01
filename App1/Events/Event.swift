//
//  Event.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import SwiftUI

struct Event: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var attendees: Int
    var isRSVP: Bool
    var timing: String
    var location: String
}
