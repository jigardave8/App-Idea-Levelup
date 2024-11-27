//
//  HomePage.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import SwiftUI
import FirebaseFirestore

struct HomePage: View {
    @StateObject private var viewModel = HomePageViewModel()
    @State private var newPostContent = ""

    var body: some View {
        NavigationView {
            VStack {
                NewPostView(newPostContent: $newPostContent, addPost: {
                    viewModel.addPost(content: newPostContent)
                    newPostContent = ""
                })
                .padding()

                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(viewModel.posts) { post in
                            PostRowView(post: post)
                                .padding()
                        }
                    }
                }
            }
            .navigationTitle("Home")
            .onAppear {
                viewModel.fetchPosts()
            }
        }
    }
}
