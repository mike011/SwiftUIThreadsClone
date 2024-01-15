//
//  FieldViewModel.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-15.
//

import Foundation

@MainActor
class FieldViewModel: ObservableObject {
    @Published var threads = [Thread]()

    init() {
        Task { try await fetchThreads() }
    }

    func fetchThreads() async throws {
        threads = try await ThreadService.fetchThreads()
        try await fetchUerDataForThreads()
    }

    private func fetchUerDataForThreads() async throws {
        for i in 0..<threads.count {
            let thread = threads[i]
            let ownerUid = thread.ownerUid
            let threadUser = try await UserService.fetUser(withUid: ownerUid)
            threads[i].user = threadUser
        }
    }
}
