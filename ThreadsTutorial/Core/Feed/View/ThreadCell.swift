//
//  ThreadCell.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

import SwiftUI

struct ThreadCell: View {
    let thread: Thread
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12, content: {
                CircularProfileImageView(user: thread.user, size: .small)

                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                        .fontWeight(.semibold)
                        Spacer()

                        Text("10m")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))

                        Button {

                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }

                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)

                    HStack(spacing: 16) {
                        Button {

                        } label: {
                            Image(systemName: "heart")
                        }

                        Button {

                        } label: {
                            Image(systemName: "bubble.right")
                        }

                        Button {

                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }

                        Button {

                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                }
            })

            Divider()
        }
        .padding()
    }
}

#Preview {
    ThreadCell(thread: DeveloperPreview.shared.thread)
}
