//
//  EditProfileView.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])

                VStack {
                    // name and profile image
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)

                            Text("Homer Simpsoson")
                        }

                        Spacer()

                        CircularProfileImageView()
                    }

                    Divider()

                    // bio field
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)

                        TextField("Enter your bio...", text: $bio, axis: .vertical)
                    }

                    Divider()

                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)

                        TextField("Add link...", text: $link)
                    }

                    Divider()

                    Toggle("Private profile", isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
                .cornerRadius(10)
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {

                    }
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                }

                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {

                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
