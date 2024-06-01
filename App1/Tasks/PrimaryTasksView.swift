//
//  PrimaryTasksView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// PrimaryTasksView.swift

// PrimaryTasksView.swift

import SwiftUI

struct PrimaryTasksView: View {
    let primaryTasks = TaskData.tasks.filter { $0.type == .primary }
    
    var body: some View {
        List(primaryTasks) { task in
            TaskRow(task: task)
                .padding(.vertical, 8)
        }
        .listStyle(PlainListStyle())
    }
}
