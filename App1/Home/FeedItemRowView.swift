//
//  FeedItemRowView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// FeedItemRowView.swift
import SwiftUI

struct FeedItemRowView: View {
    var feedItem: FeedItem

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: feedItem.image)
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.top, 4)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(feedItem.person)
                    .font(.headline)
                Text(feedItem.action)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                if !feedItem.details.isEmpty {
                    Text(feedItem.details)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Text(feedItem.date, style: .time)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
}
