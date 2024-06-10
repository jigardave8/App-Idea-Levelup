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
                .padding()
            Text(item.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text(String(format: "$%.2f", item.price))
                .font(.title)
                .padding()
            Text(item.description)
                .padding()
                .font(.body)
            Button(action: {
                cart.add(item: item)
            }) {
                Text("Add to Cart")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.top, 20)
            Spacer()
        }
        .navigationTitle(item.name)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
    }
}
