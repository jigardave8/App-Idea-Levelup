//
//  BrowseCoursesView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var duration: String
    var cost: String
    var description: String
}

struct BrowseCoursesView: View {
    @State private var searchText: String = ""
    
    // Sample course data
    let courses: [Course] = [
        Course(title: "Data Science - Zero to Mastery", duration: "1 month", cost: "Free", description: "Learn data science from scratch."),
        Course(title: "iOS Development - Zero to Mastery", duration: "2 months", cost: "$99", description: "Become an iOS developer."),
        Course(title: "Web Development Bootcamp", duration: "3 months", cost: "$149", description: "Master web development skills."),
        Course(title: "Machine Learning Essentials", duration: "1.5 months", cost: "Free", description: "Get started with machine learning."),
        Course(title: "Python Programming Course", duration: "1 month", cost: "$49", description: "Learn Python programming language."),
        Course(title: "UI/UX Design Fundamentals", duration: "2 weeks", cost: "Free", description: "Understand UI/UX principles."),
    ]
    
    var filteredCourses: [Course] {
        if searchText.isEmpty {
            return courses
        } else {
            return courses.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        VStack {
            Text("Browse Courses")
                .font(.title)
                .padding()
            
            SearchBar(text: $searchText)
                .padding(.horizontal)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(filteredCourses) { course in
                        CourseCard(course: course)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Browse Courses")
    }
}

struct CourseCard: View {
    let course: Course
    
    var body: some View {
        NavigationLink(destination: CourseDetailView(course: course)) {
            VStack(alignment: .center) {
                Text(course.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text("Duration: \(course.duration)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Cost: \(course.cost)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(course.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                Spacer()
            }
            .padding()
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
            .shadow(radius: 3)
        }
    }
}


struct BrowseCoursesView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseCoursesView()
    }
}
