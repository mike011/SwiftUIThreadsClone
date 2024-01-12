//
//  LoginView.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationStack {
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
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
                SecureField("Enter your password", text: $password)
                    .modifier(ThreadsTextFieldModifier())
            }

            NavigationLink {
                Text("Forgot Password")
            } label: {
                Text("Forgot Password?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.vertical)
                    .padding(.trailing, 28)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }

            Button {

            } label: {
                Text("Login")
                    .modifier(ThreadsButtonFieldModifier())
            }

            Spacer()

            Divider()
            NavigationLink {
                RegistrationView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack(spacing: 3) {
                    Text("Dont have an account?")

                    Text("Sign up")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    LoginView()
}
