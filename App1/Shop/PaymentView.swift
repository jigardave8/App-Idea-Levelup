//
//  PaymentView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// PaymentView.swift
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
                // For example, simulate payment process
                processPayment()
            }) {
                Text("Pay Now")
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
        .navigationTitle("Payment")
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
    }

    func processPayment() {
        // Placeholder for payment processing logic
        print("Payment processed for total: \(cart.total)")
    }
}
