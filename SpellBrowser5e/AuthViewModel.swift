//
//  AuthViewModel.swift
//  SpellBrowser5e
//
//  Created by Connor Townsend on 4/19/26.
//

import Foundation
import FirebaseAuth
import Combine

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var errorMessage = ""

    init() {
        self.isLoggedIn = Auth.auth().currentUser != nil
    }

    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = error.localizedDescription
                } else {
                    self.isLoggedIn = true
                }
            }
        }
    }

    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = error.localizedDescription
                } else {
                    self.isLoggedIn = true
                }
            }
        }
    }

    func logout() {
        try? Auth.auth().signOut()
        self.isLoggedIn = false
    }
}
