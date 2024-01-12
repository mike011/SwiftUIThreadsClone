//
//  ProfileView.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    var body: some View {
        ScrollView(showsIndicators: false) {
            // bio and stats
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        // full name and user name
                        VStack(alignment: .leading, content: {
                            Text("Homer Simpson")
                                .font(.title2)
                                .fontWeight(.semibold)

                            Text("homer_simpson")
                                .font(.subheadline)
                        })

                        Text("Cartoon Character")
                            .font(.footnote)

                        Text("3 follower")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }

                    Spacer()

                    CircularProfileImageView()
                }

                Button(action: {}, label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                })

                // user content list view
                VStack {
                    HStack {
                        ForEach(ProfileThreadFilter.allCases) { filter in
                            VStack {
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                
                                if selectedFilter == filter {
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .frame(width: 180, height: 1)
                                        .matchedGeometryEffect(id: "item", in: animation)
                                } else {
                                    Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 180, height: 1)
                                }
                            }
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedFilter = filter
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView()
}
