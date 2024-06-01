//
//  EventData.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import SwiftUI

struct EventData {
    static let events = [
        Event(name: "SwiftUI Workshop",
              description: "Learn the basics of SwiftUI and build your first app.",
              attendees: 25,
              isRSVP: true,
              timing: "June 10, 2024 - 10:00 AM",
              location: "Room 101, Tech Park"),
        Event(name: "AI Conference",
              description: "Explore the latest trends in artificial intelligence.",
              attendees: 100,
              isRSVP: false,
              timing: "July 15, 2024 - 9:00 AM",
              location: "Conference Hall A"),
        Event(name: "Networking Meetup",
              description: "Meet and connect with industry professionals.",
              attendees: 50,
              isRSVP: true,
              timing: "August 20, 2024 - 6:00 PM",
              location: "Cafe Central"),
        Event(name: "Startup Pitch Night",
              description: "Watch startups pitch their ideas to investors.",
              attendees: 75,
              isRSVP: false,
              timing: "September 5, 2024 - 7:00 PM",
              location: "Main Auditorium"),
        Event(name: "Coding Hackathon",
              description: "Participate in a 24-hour coding challenge.",
              attendees: 200,
              isRSVP: true,
              timing: "October 12, 2024 - 8:00 AM",
              location: "Tech Arena")
    ]
}
