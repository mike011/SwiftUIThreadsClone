//
//  CreateThreadViewModel.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-15.
//

import Firebase

class CreateThreadViewModel: ObservableObject, @unchecked Sendable {
    @Published var caption = ""

    func uploadThread() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: uid,
                            caption: caption, 
                            timestamp: Timestamp(),
                            like: 0)
        try await ThreadService.uploadThread(thread)
    }
}
