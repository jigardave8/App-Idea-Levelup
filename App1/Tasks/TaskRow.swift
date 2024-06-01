//
//  TaskRow.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// TaskRow.swift

import SwiftUI

struct TaskRow: View {
    var task: Task
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? .green : .gray)
                .font(.system(size: 22))
                .onTapGesture {
                    // Toggle task completion here
                    // For example: task.isCompleted.toggle()
                }
            
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                Text(task.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text("\(task.points) pts")
                .foregroundColor(.blue)
        }
        .padding(.vertical, 8)
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: Task(title: "Watch Course Videos", description: "Complete today's assigned videos", type: .primary, points: 10))
            .previewLayout(.fixed(width: 300, height: 60))
    }
}
