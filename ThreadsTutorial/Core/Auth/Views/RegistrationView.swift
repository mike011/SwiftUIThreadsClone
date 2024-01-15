//
//  RegistrationView.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Spacer()
            Image("threads-app-icon")
                .resizable()
                .frame(width: 120, height: 120)
                .padding()
        }

        VStack {
            TextField("Enter your email", text: $viewModel.email)
                .autocapitalization(.none)
                .modifier(ThreadsTextFieldModifier())

            SecureField("Enter your password", text: $viewModel.password)
                .modifier(ThreadsTextFieldModifier())

            TextField("Enter your full name", text: $viewModel.fullName)
                .modifier(ThreadsTextFieldModifier())

            TextField("Enter your user name", text: $viewModel.userName)
                .autocapitalization(.none)
                .modifier(ThreadsTextFieldModifier())
        }

        Button {
            Task { try await viewModel.createUser() }
        } label: {
            Text("Sign Up")
                .modifier(ThreadsButtonFieldModifier())
        }
        .padding(.vertical)

        Spacer()

        Divider()

        Button {
            dismiss()
        } label: {
            HStack(spacing: 3) {
                Text("Already have an account?")

                Text("Sign in")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.black)
            .font(.footnote)
        }.padding(.vertical, 16)

    }
}

#Preview {
    RegistrationView()
}
