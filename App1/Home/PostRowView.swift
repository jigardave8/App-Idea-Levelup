//
//  PostRowView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//
import SwiftUI

struct PostRowView: View {
    @State private var liked = false
    var post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
                Text(post.author)
                    .font(.headline)
            }

            Text(post.content)
                .font(.body)
                .foregroundColor(.primary)

            HStack {
                Button(action: {
                    withAnimation {
                        liked.toggle()
                    }
                }) {
                    Image(systemName: liked ? "heart.fill" : "heart")
                        .foregroundColor(liked ? .red : .gray)
                        .scaleEffect(liked ? 1.2 : 1)
                        .animation(.spring(response: 0.3, dampingFraction: 0.6))
                }

                Button(action: {
                    // Handle comment action
                }) {
                    Image(systemName: "bubble.right")
                        .foregroundColor(.gray)
                }

                Spacer()

                Text(post.date, style: .time)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.top, 4)
            .padding(.bottom, 8)
        }
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.vertical, 8)
    }
}
