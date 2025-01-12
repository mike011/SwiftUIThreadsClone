//
//  EditProfileViewModel.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-14.
//

import Foundation
import SwiftUI
import PhotosUI

class EditProfileViewModel: ObservableObject, @unchecked Sendable {
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task { await loadImage() }
        }
    }
    @Published var profileImage: Image?
    private var uiImage: UIImage?

    func updateUserData() async throws {
        try await updateProfileImage()
    }

    private func loadImage() async {
        guard let item = selectedItem else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }

    private func updateProfileImage() async throws {
        guard let image = uiImage else { return }
        guard let imageUrl = try? await ImageUploader.uploadImage(image) else { return }
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
    }
}
