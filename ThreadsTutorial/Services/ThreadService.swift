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

    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore
            .firestore()
            .collection("thread")
            .order(by: "timestamp", descending: true)
            .getDocuments()

        return snapshot.documents.compactMap { try? $0.data(as: Thread.self)}
    }

    static func fetchUserThreads(uid: String) async throws -> [Thread] {
        let snapshot = try await Firestore
            .firestore()
            .collection("thread")
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()

        let threads = snapshot.documents.compactMap { try? $0.data(as: Thread.self)}
        return threads.sorted { $0.timestamp.dateValue() > $1.timestamp.dateValue() }
    }
}
