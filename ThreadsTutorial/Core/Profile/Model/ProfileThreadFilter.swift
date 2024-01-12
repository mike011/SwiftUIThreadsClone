//
//  ProfileThreadFilter.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies

    var title: String {
        switch self {
        case .threads:
            return "Threads"
        case .replies:
            return "Replies"
        }
    }

    var id: Int { return self.rawValue }
}
