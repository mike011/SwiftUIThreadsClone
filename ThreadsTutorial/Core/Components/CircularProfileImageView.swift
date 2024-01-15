//
//  CircularProfileImageView.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

import Kingfisher
import SwiftUI

struct CircularProfileImageView: View {
    var user: User?

    var body: some View {
        if let iamgeUrl = user?.profileImageUrl {

        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .scaledToFill()
        }
    }
}

#Preview {
    CircularProfileImageView()
}
