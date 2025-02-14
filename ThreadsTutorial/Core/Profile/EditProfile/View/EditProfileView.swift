//
//  EditProfileView.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

import SwiftUI
import PhotosUI

@MainActor
struct EditProfileView: View {
    let user: User
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()

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

                            Text(user.fullname)
                        }

                        Spacer()

                        PhotosPicker(selection: $viewModel.selectedItem) { [viewModel] in
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImageView(user: user, size: .small)
                            }
                        }

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
                        dismiss()
                    }
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                }

                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        Task { 
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: EditProfileView {
        EditProfileView(user: dev.user)
    }
    typealias Previews = EditProfileView

}
