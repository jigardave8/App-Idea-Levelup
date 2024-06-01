//
//  TasksPage.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

import SwiftUI

struct TasksPage: View {
    @State private var tasks = TaskData.tasks

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Primary Tasks")) {
                    ForEach(tasks.filter { $0.type == .primary }) { task in
                        TaskRow(task: task)
                    }
                }

                Section(header: Text("Secondary Tasks")) {
                    ForEach(tasks.filter { $0.type == .secondary }) { task in
                        TaskRow(task: task)
                    }
                }

                Section(header: Text("Tertiary Tasks")) {
                    ForEach(tasks.filter { $0.type == .tertiary }) { task in
                        TaskRow(task: task)
                    }
                }
            }
            .navigationTitle("Tasks")
        }
    }
}

struct TaskRow: View {
    @State var task: Task

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(task.title)
                    .font(.headline)
                Text(task.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Points: \(task.points)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Button(action: {
                task.isCompleted.toggle()
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
                    .imageScale(.large)
            }
        }
        .padding(8)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}
