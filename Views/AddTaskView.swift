//
//  AddTaskView.swift
//  TaskMaster
//
//  Created by Marco Antonio López Sánchez on 22/11/24.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var tasks: [Task]
    @State private var title: String = ""
    @State private var details: String = ""
    @State private var date: Date = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Information")) {
                    TextField("Title", text: $title)
                    TextField("Details", text: $details)
                    DatePicker("Due Date", selection: $date, displayedComponents: .date)
                }
                Button(action: addTask) {
                    Text("Add Task")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Add New Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }

    private func addTask() {
        let newTask = Task(title: title, details: details, isCompleted: false, date: date)
        tasks.append(newTask)
        dismiss()
    }
}

#Preview {
    AddTaskView(tasks: .constant([]))
}
