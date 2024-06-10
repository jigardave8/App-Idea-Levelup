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
            List {
                Section(header: Text("Account").font(.headline).padding(.top, 20)) {
                    NavigationLink(destination: EditProfilePage()) {
                        Label("Edit Profile", systemImage: "person.circle")
                            .font(.system(size: 18, weight: .medium))
                            .padding(.vertical, 8)
                    }
                    NavigationLink(destination: Text("App Info")) {
                        Label("App Info", systemImage: "info.circle")
                            .font(.system(size: 18, weight: .medium))
                            .padding(.vertical, 8)
                    }
                    NavigationLink(destination: Text("Rate the App")) {
                        Label("Rate the App", systemImage: "star.circle")
                            .font(.system(size: 18, weight: .medium))
                            .padding(.vertical, 8)
                    }
                }
                
                Section {
                    Button(action: {
                        loginState.isLoggedIn = false
                    }) {
                        Label("Logout", systemImage: "arrowshape.turn.up.backward")
                            .font(.system(size: 18, weight: .medium))
                            .padding(.vertical, 8)
                            .foregroundColor(.red)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Profile")
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage().environmentObject(LoginState())
    }
}
