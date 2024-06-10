//
//  ProfilePage.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import SwiftUI

struct ProfilePage: View {
    @EnvironmentObject var loginState: LoginState
    
    var body: some View {
        NavigationView {
            VStack {
                // Profile Header
                ProfileHeaderView()
                
                // Account Section
                CardView {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Account")
                            .font(.headline)
                            .padding(.top, 20)
                        
                        NavigationLink(destination: EditProfilePage()) {
                            ProfileRowView(title: "Edit Profile", systemImage: "person.circle")
                        }
                        NavigationLink(destination: Text("App Info")) {
                            ProfileRowView(title: "App Info", systemImage: "info.circle")
                        }
                        NavigationLink(destination: Text("Rate the App")) {
                            ProfileRowView(title: "Rate the App", systemImage: "star.circle")
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
                
                // Logout Button
                Button(action: {
                    withAnimation {
                        loginState.isLoggedIn = false
                    }
                }) {
                    Text("Logout")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("Profile")
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage().environmentObject(LoginState())
    }
}

// Profile Header View
struct ProfileHeaderView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
                .padding(.top, 20)
            
            Text("Jay")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 10)
            
            Text("Jay@example.com")
                .font(.subheadline)
                .padding(.bottom, 20)
                .background(.green)
            
            
        }
    }
}

// Custom Card View
struct CardView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

// Profile Row View
struct ProfileRowView: View {
    let title: String
    let systemImage: String
    
    var body: some View {
        HStack {
            Label(title, systemImage: systemImage)
                .font(.headline)
                .foregroundColor(.primary)
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
