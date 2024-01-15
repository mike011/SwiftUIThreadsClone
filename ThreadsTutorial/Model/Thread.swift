//
//  Thread.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-15.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
    @DocumentID var threadID: String?
    var id: String {
        return threadID ?? NSUUID().uuidString
    }
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var like: Int

    var user: User?
}
