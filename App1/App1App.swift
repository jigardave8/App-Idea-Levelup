//
//  App1App.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//
import SwiftUI

@main
struct App1App: App {
    @StateObject private var loginState = LoginState()
    @StateObject private var cart = Cart()
    
    var body: some Scene {
        WindowGroup {
            if loginState.isLoggedIn {
                MainTabView()
                    .environmentObject(loginState)
                    .environmentObject(cart)
            } else {
                LoginPage()
                    .environmentObject(loginState)
            }
        }
    }
}
