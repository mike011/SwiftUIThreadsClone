//
//  ExploreView.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 10, id: \.self) { user in
                        VStack {
                            UserCell()
                            Divider()
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
