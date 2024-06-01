//
//  FeedItem.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import SwiftUI

struct FeedItem: Identifiable {
    var id = UUID()
    var person: String
    var action: String
    var details: String
    var date: Date
    var image: String // URL or system image name
}
