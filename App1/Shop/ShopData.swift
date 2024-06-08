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
        Item(name: "Sweatshirt", description: "Warm sweatshirt for cold days", price: 29.99, imageName: "sweatshirt", dateAdded: Date(), popularity: 3),
        Item(name: "Hat", description: "Stylish hat for sunny days", price: 14.99, imageName: "hat", dateAdded: Date(), popularity: 4),
        Item(name: "Socks", description: "Cozy socks for everyday wear", price: 7.99, imageName: "socks", dateAdded: Date(), popularity: 3),
        Item(name: "Backpack", description: "Durable backpack for adventures", price: 39.99, imageName: "backpack", dateAdded: Date(), popularity: 5),
        Item(name: "Phone Case", description: "Protective case for your phone", price: 12.99, imageName: "phonecase", dateAdded: Date(), popularity: 4),
        Item(name: "Water Bottle", description: "Reusable water bottle for hydration", price: 9.99, imageName: "waterbottle", dateAdded: Date(), popularity: 4),
        Item(name: "Notebook", description: "Elegant notebook for writing notes", price: 6.99, imageName: "notebook", dateAdded: Date(), popularity: 3),
        Item(name: "Pencil Set", description: "Set of high-quality pencils", price: 8.99, imageName: "pencilset", dateAdded: Date(), popularity: 3),
        // Add more items as needed
    ]
}

