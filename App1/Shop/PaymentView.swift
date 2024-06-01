//
//  PaymentView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// PaymentView.swift
import SwiftUI

struct PaymentView: View {
    @EnvironmentObject var cart: Cart

    var body: some View {
        VStack {
            Text("Total: \(String(format: "$%.2f", cart.total))")
                .font(.largeTitle)
                .padding()
            Button(action: {
                // Implement payment logic here
            }) {
                Text("Pay Now")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .navigationTitle("Payment")
    }
}
