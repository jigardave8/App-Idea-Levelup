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
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(event.name)
                                .font(.headline)
                            Text(event.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        if event.isRSVP {
                            Text("RSVP")
                                .font(.caption)
                                .padding(5)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }
                    }
                    
                    HStack {
                        Text("Attendees: \(event.attendees)")
                        Spacer()
                        Text(event.timing)
                    }
                    .font(.footnote)
                    .foregroundColor(.gray)
                    
                    HStack {
                        Image(systemName: "location.fill")
                            .foregroundColor(.gray)
                        Text(event.location)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    
                }
                .padding(.vertical, 10)
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
