//
//  NewPostView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// NewPostView.swift
import SwiftUI

struct NewPostView: View {
    @Binding var newPostContent: String
    var addPost: () -> Void

    var body: some View {
        VStack {
            TextField("What's on your mind?", text: $newPostContent)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button(action: {
                addPost()
            }) {
                Text("Post")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}
