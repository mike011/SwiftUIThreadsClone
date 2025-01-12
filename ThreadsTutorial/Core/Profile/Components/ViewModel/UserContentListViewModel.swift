//
//  UserContentListViewModel.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-15.
//

import Foundation

class UserContentListViewModel: ObservableObject, @unchecked Sendable {
    @Published var threads = [Thread]()

    let user: User

    init(user: User) {
        self.user = user
        Task { try await fetchUserThreads() }
    }

    func fetchUserThreads() async throws {
        var threads = try await ThreadService.fetchUserThreads(uid: user.id)

        for i in 0..<threads.count {
            threads[i].user = self.user
        }

        self.threads = threads
    }
}
