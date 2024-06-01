//
//  SecondaryTasksView.swift
//  App1
//
//  Created by Jigar on 01/06/24.
//

// SecondaryTasksView.swift
// SecondaryTasksView.swift

import SwiftUI

struct SecondaryTasksView: View {
    let secondaryTasks = TaskData.tasks.filter { $0.type == .secondary }
    
    var body: some View {
        List(secondaryTasks) { task in
            TaskRow(task: task)
                .padding(.vertical, 8)
        }
        .listStyle(PlainListStyle())
    }
}
