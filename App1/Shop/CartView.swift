//
//  CartView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// CartView.swift
import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: Cart

    var body: some View {
        NavigationView {
            List {
                ForEach(cart.items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text(String(format: "$%.2f", item.price))
                    }
                }
                .onDelete(perform: deleteItems)
                
                HStack {
                    Text("Total")
                        .font(.headline)
                    Spacer()
                    Text(String(format: "$%.2f", cart.total))
                        .font(.headline)
                }
                .padding()
            }
            .navigationTitle("Cart")
            .navigationBarItems(trailing: NavigationLink(destination: PaymentView()) {
                Text("Checkout")
                    .font(.headline)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
        }
    }

    func deleteItems(at offsets: IndexSet) {
        offsets.forEach { cart.items.remove(at: $0) }
    }
}
