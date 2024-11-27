//
//  App1App.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//
import SwiftUI


import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct LevelUp: App {
    @StateObject private var loginState = LoginState()
    @StateObject private var cart = Cart()
    // register app delegate for Firebase setup
     @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    
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
