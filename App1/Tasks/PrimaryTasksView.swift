//
//  PrimaryTasksView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// PrimaryTasksView.swift
import SwiftUI

struct PrimaryTasksView: View {
    @State private var showAddTaskView = false
    @ObservedObject var taskData = TaskData()
    
    var primaryTasks: [Task] {
        taskData.tasks.filter { $0.type == .primary }
    }

    var body: some View {
        VStack {
            List(primaryTasks) { task in
                TaskRow(task: task)
                    .padding(.vertical, 8)
            }
            .listStyle(PlainListStyle())

            Button(action: {
                showAddTaskView.toggle()
            }) {
                Text("Add New Task")
                    .font(.headline)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .sheet(isPresented: $showAddTaskView) {
            AddTaskView(taskData: taskData)
        }
    }
}
