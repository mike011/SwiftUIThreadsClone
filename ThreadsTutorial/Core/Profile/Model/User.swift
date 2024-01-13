//
//  User.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
