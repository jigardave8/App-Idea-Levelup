//
//  ShopData.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// ShopData.swift
import Foundation

struct ShopData {
    static let items: [Item] = [
        Item(name: "T-Shirt", description: "Comfortable cotton t-shirt", price: 19.99, imageName: "tshirt", dateAdded: Date(), popularity: 5),
        Item(name: "Mug", description: "Ceramic mug with cool design", price: 9.99, imageName: "mug", dateAdded: Date(), popularity: 4),
        // Add more items as needed
    ]
}
