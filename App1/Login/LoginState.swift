//
//  LoginState.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//
import SwiftUI
import Combine

class LoginState: ObservableObject {
    @Published var isLoggedIn: Bool = false
}
