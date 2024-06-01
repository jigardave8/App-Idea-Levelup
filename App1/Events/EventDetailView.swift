//
//  EventDetailView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import SwiftUI

struct EventDetailView: View {
    var event: Event

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(event.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(event.timing)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack {
                    Image(systemName: "location.fill")
                        .foregroundColor(.gray)
                    Text(event.location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Text(event.description)
                    .font(.body)
                
                HStack {
                    Text("Attendees: \(event.attendees)")
                        .font(.subheadline)
                    Spacer()
                    if event.isRSVP {
                        Text("RSVP Required")
                            .font(.subheadline)
                            .foregroundColor(.red)
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Event Details")
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: EventData.events[0])
    }
}
