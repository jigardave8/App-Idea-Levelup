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
                // New Post View
                NewPostView(newPostContent: $newPostContent, addPost: addNewPost)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .shadow(radius: 5)
                
                // Mixed Feed List
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
                                    .transition(.slide)
                                    .animation(.easeInOut)
                            case .post(let post):
                                PostRowView(post: post)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                    .transition(.slide)
                                    .animation(.easeInOut)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Home")
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            )
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
