//
//  AddTaskView.swift
//  App1
//
//  Created by Jigar on 10/06/24.
//


// AddTaskView.swift
import SwiftUI

struct AddTaskView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var type: TaskType = .primary
    @State private var points: Int = 0
    @State private var dueDate: Date = Date()
    @State private var priority: TaskPriority = .medium

    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var taskData: TaskData
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Info")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)

                    Picker("Type", selection: $type) {
                        Text("Primary").tag(TaskType.primary)
                        Text("Secondary").tag(TaskType.secondary)
                        Text("Tertiary").tag(TaskType.tertiary)
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    Stepper(value: $points, in: 0...100) {
                        Text("Points: \(points)")
                    }

                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)

                    Picker("Priority", selection: $priority) {
                        Text("High").tag(TaskPriority.high)
                        Text("Medium").tag(TaskPriority.medium)
                        Text("Low").tag(TaskPriority.low)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Button(action: saveTask) {
                    Text("Save Task")
                }
            }
            .navigationBarTitle("Add Task", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    private func saveTask() {
        let newTask = Task(title: title, description: description, type: type, points: points, dueDate: dueDate, priority: priority)
        taskData.tasks.append(newTask)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(taskData: TaskData())
    }
}
