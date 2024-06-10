//
//  EventDetailView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import SwiftUI

struct EventDetailView: View {
    var event: Event
    @State private var isRSVPed = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Event Name
                Text(event.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
                // Event Timing
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(.blue)
                    Text(event.timing)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                // Event Location
                HStack {
                    Image(systemName: "location.fill")
                        .foregroundColor(.blue)
                    Text(event.location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                // Event Description
                Text(event.description)
                    .font(.body)
                    .padding(.vertical, 10)
                
                // Event Attendees and RSVP
                HStack {
                    Image(systemName: "person.3.fill")
                        .foregroundColor(.blue)
                    Text("Attendees: \(event.attendees)")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    if event.isRSVP {
                        Button(action: {
                            withAnimation {
                                isRSVPed.toggle()
                            }
                        }) {
                            Text(isRSVPed ? "RSVP'd" : "RSVP")
                                .font(.headline)
                                .padding()
                                .background(isRSVPed ? Color.green : Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .transition(.scale)
                    }
                }
                
                // Placeholder for additional interactive elements (e.g., Comments, Map)
                VStack(alignment: .leading, spacing: 16) {
                    Text("Comments")
                        .font(.headline)
                    
                    ForEach(0..<5) { _ in
                        HStack {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.blue)
                            VStack(alignment: .leading) {
                                Text("User Name")
                                    .font(.headline)
                                Text("This is a sample comment.")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        .padding(.vertical, 5)
                    }
                    
                    // Placeholder for Map or other content
                    HStack {
                        Image(systemName: "map")
                            .foregroundColor(.blue)
                        Text("View Map")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
                    .onTapGesture {
                        // Handle map view action
                    }
                }
            }
            .padding()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        )
        .navigationTitle("Event Details")
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: EventData.events[0])
    }
}
