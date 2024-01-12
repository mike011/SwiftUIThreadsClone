//
//  CircularProfileImageView.swift
//  ThreadsTutorial
//
//  Created by Michael Charland on 2024-01-12.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("homer")
            .resizable()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .scaledToFill()
    }
}

#Preview {
    CircularProfileImageView()
}
