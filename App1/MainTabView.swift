//
//  MainTabView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            EventsPage()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Events")
                }
            
            TasksPage()
                .tabItem {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Tasks")
                }
            
            ShopPage()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Shop")
                }
            
            ProfilePage()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView().environmentObject(LoginState())
    }
}
