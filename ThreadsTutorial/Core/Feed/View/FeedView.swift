//
//  FeedView.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false, content: {
                LazyVStack {
                    ForEach(0 ... 10, id: \.self)  { thread in
                        ThreadCell()
                    }
                }
            }).refreshable {
                print("DEBUG: Refresh Threads")
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
