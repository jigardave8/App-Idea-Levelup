//
//  NewPostView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import SwiftUI

struct NewPostView: View {
    @Binding var newPostContent: String
    var addPost: () -> Void

    var body: some View {
        VStack {
            TextField("What's on your mind?", text: $newPostContent)
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
            
            Button(action: {
                addPost()
            }) {
                Text("Post")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
            }
            .padding(.horizontal)
            .padding(.top, 10)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
        .padding()
    }
}
