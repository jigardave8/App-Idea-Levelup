//
//  CourseDetailView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import SwiftUI
struct CourseDetailView: View {
    let course: Course
    
    var body: some View {
        VStack {
            Text(course.title)
                .font(.title)
                .padding()
            
            Text("Duration: \(course.duration)")
                .font(.headline)
                .padding(.bottom)
            
            Text("Cost: \(course.cost)")
                .font(.headline)
                .padding(.bottom)
            
            Text(course.description)
                .font(.body)
                .foregroundColor(.secondary)
                .padding()
            
            Divider()
            
            // List of videos
            List {
                ForEach(1..<6) { index in
                    Text("Video \(index)")
                }
            }
            .navigationBarTitle(Text("Course Detail"), displayMode: .inline)
        }
    }
}
