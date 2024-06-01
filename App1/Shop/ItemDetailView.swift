//
//  ItemDetailView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// ItemDetailView.swift
import SwiftUI

struct ItemDetailView: View {
    var item: Item
    @EnvironmentObject var cart: Cart

    var body: some View {
        VStack {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
            Text(item.name)
                .font(.largeTitle)
                .padding()
            Text(String(format: "$%.2f", item.price))
                .font(.title)
                .padding()
            Text(item.description)
                .padding()
            Button(action: {
                cart.add(item: item)
            }) {
                Text("Add to Cart")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .navigationTitle(item.name)
    }
}
