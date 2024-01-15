//
//  Timestamp.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-15.
//

import Firebase

extension Timestamp {
    func timestampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: dateValue(), to: Date()) ?? ""
    }
}
