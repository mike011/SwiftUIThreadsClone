//
//  CurrentUserProfileViewModel.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

import Foundation
import Combine

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSuscribers()
    }

    private func setupSuscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}
