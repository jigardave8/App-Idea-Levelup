//
//  MixedFeedItem.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// MixedFeedItem.swift
import Foundation

enum MixedFeedItem: Identifiable {
    case feed(FeedItem)
    case post(Post)
    
    var id: UUID {
        switch self {
        case .feed(let feedItem):
            return feedItem.id
        case .post(let post):
            return post.id
        }
    }
    
    var date: Date {
        switch self {
        case .feed(let feedItem):
            return feedItem.date
        case .post(let post):
            return post.date
        }
    }
}
