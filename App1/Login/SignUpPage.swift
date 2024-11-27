//
//  SignUpPage.swift
//  LevelUp
//
//  Created by BitDegree on 27/11/24.
//


import SwiftUI
import FirebaseAuth

struct SignUpPage: View {
    @Environment(\.dismiss) var dismiss
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isAnimating: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.orange]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Text("Sign Up")
                    .font(.system(size: 34, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                    .opacity(isAnimating ? 1 : 0)
                    .scaleEffect(isAnimating ? 1 : 0.5)
                    .animation(Animation.easeOut(duration: 1.0).delay(0.3), value: isAnimating)

                TextField("Email", text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                    .padding(.horizontal, 40)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                    .padding(.horizontal, 40)

                SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .background(Color.gray.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                    .padding(.horizontal, 40)

                // Sign-Up Button
                Button(action: registerUser) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
                .padding(.horizontal, 40)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Sign-Up Status"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .onAppear {
            self.isAnimating = true
        }
    }

    private func registerUser() {
        guard password == confirmPassword else {
            alertMessage = "Passwords do not match"
            showAlert = true
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                alertMessage = "Sign-Up failed: \(error.localizedDescription)"
                showAlert = true
            } else {
                alertMessage = "Account created successfully! ..."
                showAlert = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    dismiss() // Automatically go back to LoginPage
                }
            }
        }
    }
}
