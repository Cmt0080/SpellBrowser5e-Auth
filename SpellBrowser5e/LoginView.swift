//
//  LoginView.swift
//  SpellBrowser5e
//
//  Created by Connor Townsend on 4/19/26.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var authViewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var showSignUp = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("SpellBrowser5e")
                    .font(.largeTitle)
                    .bold()

                Text("Sign in to continue")
                    .foregroundColor(.secondary)

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                if !authViewModel.errorMessage.isEmpty {
                    Text(authViewModel.errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                }

                Button("Log In") {
                    authViewModel.login(email: email, password: password)
                }
                .buttonStyle(.borderedProminent)

                Button("Don't have an account? Sign Up") {
                    showSignUp = true
                    authViewModel.errorMessage = ""
                }
                .font(.footnote)
            }
            .padding()
            .navigationDestination(isPresented: $showSignUp) {
                SignUpView(authViewModel: authViewModel)
            }
        }
    }
}

#Preview {
    LoginView(authViewModel: AuthViewModel())
}
