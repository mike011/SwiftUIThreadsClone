//
//  ExploreViewModel.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()

    init() { 
       // Task { try await fetchUsers() }
    }

    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
