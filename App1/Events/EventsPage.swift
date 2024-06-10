
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
                    EventRowView(event: event)
                }
                .buttonStyle(PlainButtonStyle())
                .listRowBackground(Color.clear)
            }
            .navigationTitle("Events")
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.white]), startPoint: .top, endPoint: .bottom)
                            .ignoresSafeArea())
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct EventRowView: View {
    var event: Event

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                VStack(alignment: .leading) {
                    Text(event.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text(event.description)
                        .font(.body)
                        .foregroundColor(.white.opacity(0.7))
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
                    .foregroundColor(.white.opacity(0.7))
                Spacer()
                Text(event.timing)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
            }
            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(.white.opacity(0.7))
                Text(event.location)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
            }
            HStack(spacing: -10) {
                ForEach(1...5, id: \.self) { _ in
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .padding(2)
                        .background(Color.white)
                        .clipShape(Circle())
                }
            }
        }
        .padding(15)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
        .padding(.horizontal)
        .padding(.vertical, 5)
        .scaleEffect(1.05)
        .animation(.spring())
    }
}
struct EventsPage_Previews: PreviewProvider {
    static var previews: some View {
        EventsPage()
    }
}
