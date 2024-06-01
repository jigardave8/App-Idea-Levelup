//
//  Item.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// Item.swift
import Foundation

struct Item: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var price: Double
    var imageName: String
    var dateAdded: Date
    var popularity: Int
}
