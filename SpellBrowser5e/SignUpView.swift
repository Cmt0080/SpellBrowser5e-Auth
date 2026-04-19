//
//  SignUpView.swift
//  SpellBrowser5e
//
//  Created by Connor Townsend on 4/19/26.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var authViewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("Create Account")
                .font(.largeTitle)
                .bold()

            Text("Sign up with your email")
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

            Button("Create Account") {
                authViewModel.signUp(email: email, password: password)
            }
            .buttonStyle(.borderedProminent)

            Button("Already have an account? Log In") {
                dismiss()
                authViewModel.errorMessage = ""
            }
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    LoginView(authViewModel: AuthViewModel())
}
