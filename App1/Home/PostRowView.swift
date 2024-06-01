//
//  PostRowView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//
// PostRowView.swift
import SwiftUI

struct PostRowView: View {
    @State private var liked = false
    var post: Post

    var body: some View {
        VStack(alignment: .leading) {
            Text(post.author)
                .font(.headline)
            Text(post.content)
                .font(.body)
                .padding(.top, 4)
            HStack {
                Button(action: {
                    liked.toggle()
                }) {
                    Image(systemName: liked ? "heart.fill" : "heart")
                        .foregroundColor(liked ? .red : .gray)
                }
                Button(action: {
                    // Handle comment action
                }) {
                    Image(systemName: "bubble.right")
                        .foregroundColor(.gray)
                }
                Button(action: {
                    // Handle share action
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 4)
            Text(post.date, style: .time)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
    }
}
