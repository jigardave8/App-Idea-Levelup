//
//  HomePage.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import SwiftUI

struct HomePage: View {
    @State private var posts = PostData.posts
    @State private var newPostContent = ""
    private var feeds = FeedData.feeds

    var mixedFeed: [MixedFeedItem] {
        let mixed = feeds.map { MixedFeedItem.feed($0) } + posts.map { MixedFeedItem.post($0) }
        return mixed.sorted { $0.date > $1.date }
    }

    func addNewPost() {
        let newPost = Post(author: "User", content: newPostContent, likes: 0, comments: [], date: Date())
        posts.insert(newPost, at: 0)
        newPostContent = ""
    }

    var body: some View {
        NavigationView {
            VStack {
                NewPostView(newPostContent: $newPostContent, addPost: addNewPost)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(mixedFeed) { item in
                            switch item {
                            case .feed(let feedItem):
                                FeedItemRowView(feedItem: feedItem)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            case .post(let post):
                                PostRowView(post: post)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Home")
        }
        .background(Color.gray.opacity(0.1).ignoresSafeArea())
    }
}
