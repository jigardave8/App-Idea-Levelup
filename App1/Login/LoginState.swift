//
//  LoginState.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//
import SwiftUI
import FirebaseAuth

class LoginState: ObservableObject {
    @Published var isLoggedIn: Bool = false
    private var handle: AuthStateDidChangeListenerHandle?

    init() {
        // Add a listener to monitor authentication state changes
        handle = Auth.auth().addStateDidChangeListener { _, user in
            DispatchQueue.main.async {
                self.isLoggedIn = user != nil
            }
        }
    }

    deinit {
        // Remove the listener when the object is deallocated
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
}
