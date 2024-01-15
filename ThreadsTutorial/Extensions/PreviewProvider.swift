//
//  PreviewProvider.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

import Firebase
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()

    let user = User(id: NSUUID().uuidString,
                    fullname: "Homer Simpson",
                    email: "homer@theSimpsons.com",
                    username: "homer",
                    profileImageUrl: nil,
                    bio: nil)

    let thread = Thread(threadID: nil,
                        ownerUid: "123",
                        caption: "This is a test thread",
                        timestamp: Timestamp(),
                        like: 0)
}
