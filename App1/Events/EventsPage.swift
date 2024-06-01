//
//  EventsPage.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//


import SwiftUI

struct EventsPage: View {
    @State private var events = EventData.events
    
    var body: some View {
        NavigationView {
            List(events) { event in
                NavigationLink(destination: EventDetailView(event: event)) {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(event.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text(event.description)
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                    .lineLimit(2)
                            }
                            Spacer()
                            if event.isRSVP {
                                Text("RSVP")
                                    .font(.callout)
                                    .padding(5)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                            }
                        }
                        HStack {
                            Text("Attendees: \(event.attendees)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                            Text(event.timing)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(.gray)
                            Text(event.location)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        HStack(spacing: -10) {
                            ForEach(1...5, id: \.self) { _ in
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.blue) // Set the color of the profile picture
                                    .padding(2)
                                    .background(Color.white)
                                    .clipShape(Circle())
                            }
                        }
                    }
                    .padding(15)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .shadow(radius: 3)
                }
            }
            .navigationTitle("Events")
        }
    }
}

struct EventsPage_Previews: PreviewProvider {
    static var previews: some View {
        EventsPage()
    }
}
