//
//  Post.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// Post.swift
import Foundation

struct Post: Identifiable {
    var id = UUID()
    var author: String
    var content: String
    var likes: Int
    var comments: [String]
    var date: Date
}


