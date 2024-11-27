//
//  LoginPage.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import SwiftUI
import FirebaseAuth

struct LoginPage: View {
    @EnvironmentObject var loginState: LoginState
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isAnimating: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var navigateToHome: Bool = false
    @State private var navigateToSignUp: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.pink]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    Text("LevelUp")
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

                    // Login Button
                    Button(action: loginUser) {
                        Text("Login")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.secondary]),
                                                       startPoint: .leading,
                                                       endPoint: .trailing))
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    }
                    .padding(.horizontal, 40)

                    // Sign-Up Navigation Button
                    NavigationLink(destination: SignUpPage(), isActive: $navigateToSignUp) {
                        Button(action: {
                            navigateToSignUp = true
                        }) {
                            Text("Don't have an account? Sign Up")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                        }
                    }
                    .padding(.horizontal, 40)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
            .onAppear {
                self.isAnimating = true
            }
        }
    }

    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                alertMessage = "Login failed: \(error.localizedDescription)"
                showAlert = true
            } else {
                loginState.isLoggedIn = true // You can redirect to HomeView if needed
            }
        }
    }
}
