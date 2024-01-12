//
//  UserCell.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
           CircularProfileImageView()

            VStack(alignment: .leading) {
                Text("Homer")
                    .fontWeight(.semibold)

                Text("Homer Simpson")
            }
            .font(.footnote)

            Spacer()

            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}
