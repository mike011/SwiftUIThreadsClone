//
//  ProfileHeaderView.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User?

    init(user: User?) {
        self.user = user
    }

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                // full name and user name
                VStack(alignment: .leading, content: {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text(user?.username ?? "")
                        .font(.subheadline)
                })

                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }

                Text("3 follower")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            CircularProfileImageView(user: user, size: .medium)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: ProfileHeaderView {
        ProfileHeaderView(user: dev.user)
    }
    typealias Previews = ProfileHeaderView

}

