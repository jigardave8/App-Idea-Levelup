//
//  FeedItemRowView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import SwiftUI

struct FeedItemRowView: View {
    var feedItem: FeedItem

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: feedItem.image)
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.top, 4)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(feedItem.person)
                        .font(.headline)
                    Spacer()
                    Text(feedItem.date, style: .time)
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                
                Text(feedItem.action)
                    .font(.subheadline)
                    .foregroundColor(.primary)

                if !feedItem.details.isEmpty {
                    Text(feedItem.details)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}
