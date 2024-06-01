//
//  HomePage.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// HomePage.swift
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
                List(mixedFeed) { item in
                    switch item {
                    case .feed(let feedItem):
                        FeedItemRowView(feedItem: feedItem)
                    case .post(let post):
                        PostRowView(post: post)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Home")
        }
    }
}
