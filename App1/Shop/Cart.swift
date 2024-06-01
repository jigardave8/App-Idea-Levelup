//
//  Cart.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// Cart.swift
import Foundation

class Cart: ObservableObject {
    @Published var items: [Item] = []

    func add(item: Item) {
        items.append(item)
    }

    func remove(item: Item) {
        items.removeAll { $0.id == item.id }
    }

    var total: Double {
        items.reduce(0) { $0 + $1.price }
    }
}
