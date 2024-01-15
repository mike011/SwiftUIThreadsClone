//
//  FeedView.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FieldViewModel()

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false, content: {
                LazyVStack {
                    ForEach(viewModel.threads)  { thread in
                        ThreadCell(thread: thread)
                    }
                }
            }).refreshable {
                Task { try await viewModel.fetchThreads() }
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}, label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(.black)
                })
            }
        }
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
