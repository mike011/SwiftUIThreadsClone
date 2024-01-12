//
//  RegistrationView.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var userName = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Spacer()
            Image("threads-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
        }

        VStack {
            TextField("Enter your email", text: $email)
                .modifier(ThreadsTextFieldModifier())

            SecureField("Enter your password", text: $password)
                .modifier(ThreadsTextFieldModifier())

            TextField("Enter your full name", text: $fullName)
                .modifier(ThreadsTextFieldModifier())

            TextField("Enter your user name", text: $userName)
                .modifier(ThreadsTextFieldModifier())
        }

        Button {

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
