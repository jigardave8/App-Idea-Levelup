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
                Section(header: Text("Account")) {
                    NavigationLink(destination: Text("Edit Profile")) {
                        Label("Edit Profile", systemImage: "person.circle")
                    }
                    NavigationLink(destination: Text("App Info")) {
                        Label("App Info", systemImage: "info.circle")
                    }
                    NavigationLink(destination: Text("Rate the App")) {
                        Label("Rate the App", systemImage: "star.circle")
                    }
                }
                
                Section {
                    Button(action: {
                        loginState.isLoggedIn = false
                    }) {
                        Label("Logout", systemImage: "arrowshape.turn.up.backward")
                    }
                    .foregroundColor(.red)
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
