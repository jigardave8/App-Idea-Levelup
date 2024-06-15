//
//  TasksData.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import Foundation

class TaskData: ObservableObject {
    
    
    @Published var tasks: [Task] = [
        Task(title: "Watch Course Videos", description: "Complete today's assigned videos", type: .primary, points: 10, dueDate: Date(), priority: .medium),
        Task(title: "Solve Coding Challenge", description: "Complete today's coding puzzle", type: .secondary, points: 8, dueDate: Date(), priority: .high),
        Task(title: "Join Group Project", description: "Collaborate with others on a new project", type: .tertiary, points: 5, dueDate: Date(), priority: .low),
        Task(title: "Complete Personality Development Course", description: "Watch all videos and complete assignments", type: .primary, points: 12, dueDate: Date(), priority: .medium),
        Task(title: "Solve Algorithm Problems", description: "Solve at least 5 algorithm problems on LeetCode", type: .secondary, points: 10, dueDate: Date(), priority: .high),
        Task(title: "Start Freelance Project", description: "Find a freelance project and start working on it", type: .tertiary, points: 7, dueDate: Date(), priority: .low),
        Task(title: "Join Networking Event", description: "Attend a networking event and make new connections", type: .primary, points: 10, dueDate: Date(), priority: .medium),
        Task(title: "Review Design Patterns", description: "Read articles or watch videos on design patterns", type: .secondary, points: 8, dueDate: Date(), priority: .high),
        Task(title: "Volunteer for Non-Profit Organization", description: "Offer to volunteer for a non-profit organization", type: .tertiary, points: 6, dueDate: Date(), priority: .low),
        Task(title: "Complete iOS Development Course", description: "Finish all modules and assignments", type: .primary, points: 15, dueDate: Date(), priority: .medium),
        Task(title: "Participate in Hackathon", description: "Join a hackathon and work on a project", type: .secondary, points: 12, dueDate: Date(), priority: .high),
        Task(title: "Contribute to Open Source Project", description: "Contribute code or documentation to an open source project", type: .tertiary, points: 8, dueDate: Date(), priority: .low),
        Task(title: "Attend Job Interview", description: "Prepare for and attend a job interview", type: .primary, points: 12, dueDate: Date(), priority: .medium),
        Task(title: "Write Blog Post", description: "Write a blog post on a topic of interest", type: .secondary, points: 8, dueDate: Date(), priority: .high),
        Task(title: "Complete Online Certification", description: "Enroll in and complete an online certification course", type: .tertiary, points: 10, dueDate: Date(), priority: .low),
        Task(title: "Practice Public Speaking", description: "Practice delivering a speech or presentation", type: .primary, points: 10, dueDate: Date(), priority: .medium),
        Task(title: "Attend Webinar", description: "Attend a webinar on a topic relevant to your interests", type: .secondary, points: 7, dueDate: Date(), priority: .high),
        Task(title: "Start Side Project", description: "Start working on a side project in your free time", type: .tertiary, points: 9, dueDate: Date(), priority: .low),
        Task(title: "Read Technical Book", description: "Read a technical book related to your field", type: .primary, points: 8, dueDate: Date(), priority: .medium),
        Task(title: "Attend Workshop", description: "Participate in a workshop to learn new skills", type: .secondary, points: 10, dueDate: Date(), priority: .high),
        Task(title: "Update Resume", description: "Update your resume with recent experiences and achievements", type: .tertiary, points: 5, dueDate: Date(), priority: .low),
        Task(title: "Complete Data Science Course", description: "Finish all modules and projects in a data science course", type: .primary, points: 15, dueDate: Date(), priority: .medium),
        Task(title: "Participate in Code Review", description: "Review code and provide feedback to team members", type: .secondary, points: 8, dueDate: Date(), priority: .high),
        Task(title: "Attend Tech Conference", description: "Attend a tech conference to learn about the latest trends", type: .tertiary, points: 10, dueDate: Date(), priority: .low),
        Task(title: "Practice Time Management", description: "Set goals and prioritize tasks to improve time management skills", type: .primary, points: 7, dueDate: Date(), priority: .medium),
        Task(title: "Learn New Programming Language", description: "Start learning a new programming language", type: .secondary, points: 10, dueDate: Date(), priority: .high),
        Task(title: "Complete Udemy Course", description: "Enroll in and complete a course on Udemy", type: .tertiary, points: 10, dueDate: Date(), priority: .low)
    ]
}
