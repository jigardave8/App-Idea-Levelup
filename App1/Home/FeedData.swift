//
//  FeedData.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import Foundation

struct FeedData {
    static let feeds = [
        FeedItem(person: "Person A", action: "completed Data Science course", details: "Selected for round 1 interview at IT Solutions Company", date: Date(), image: "person.fill"),
        FeedItem(person: "Person B", action: "won the hackathon for bug finding", details: "Awarded $200", date: Date(), image: "star.fill"),
        FeedItem(person: "Person C", action: "was laid off from X Company", details: "", date: Date(), image: "exclamationmark.triangle.fill"),
        FeedItem(person: "Person C", action: "offered an internship at Google", details: "", date: Date(), image: "briefcase.fill"),
        FeedItem(person: "Tutor A", action: "posted interview questions", details: "", date: Date(), image: "text.book.closed.fill"),
        FeedItem(person: "Tutor B", action: "posted sample CV format", details: "Download button available", date: Date(), image: "doc.text.fill"),
        FeedItem(person: "Person D", action: "selected for voluntary work at NGO", details: "", date: Date(), image: "hands.sparkles.fill"),
        FeedItem(person: "Person E", action: "awarded scholarship for excellent performance", details: "", date: Date(), image: "rosette"),
        FeedItem(person: "Person F", action: "nominated for quality code awards", details: "", date: Date(), image: "checkmark.seal.fill"),
        FeedItem(person: "Person G", action: "leveled up from Basic to Intermediate in iOS Development", details: "", date: Date(), image: "arrow.up.circle.fill"),
        FeedItem(person: "Person H", action: "won merchandise coupon for achieving Problem Solver place", details: "", date: Date(), image: "gift.fill")
    ]
}
