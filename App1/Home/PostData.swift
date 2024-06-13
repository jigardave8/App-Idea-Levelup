//
//  PostData.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// PostData.swift
import Foundation

struct PostData {
    static var posts: [Post] = [
        Post(author: "Tutor John", content: "Today we will learn about SwiftUI!", likes: 5, comments: ["Great lesson!", "Thank you!"], date: Date()),
        Post(author: "Tutor Jane", content: "Don't forget to submit your assignments.", likes: 3, comments: ["Got it!", "Will do!"], date: Date())
    ]
    
}


