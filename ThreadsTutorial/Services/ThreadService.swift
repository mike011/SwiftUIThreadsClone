//
//  ThreadService.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-15.
//

import Firebase
import FirebaseFirestoreSwift

struct ThreadService {

    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        _ = try await Firestore.firestore().collection("thread").addDocument(data: threadData)
    }
}
