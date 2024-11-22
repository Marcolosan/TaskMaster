//
//  TaskListView.swift
//  TaskMaster
//
//  Created by Marco Antonio López Sánchez on 17/11/24.
//

import SwiftUI

struct TaskListView: View {
    @State private var tasks: [Task] = [
        Task(title: "Buy groceries", details: "Milk, Eggs, Bread", isCompleted: false, date: Date()),
        Task(title: "Workout", details: "1 hour of cardio", isCompleted: true, date: Date())
    ]
    @State private var showAddTaskView: Bool = false

    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    NavigationLink(destination: TaskDetailView(task: task)) {
                        HStack {
                            Text(task.title)
                                .font(.headline)
                                .foregroundColor(task.isCompleted ? .customSecondaryText : .customText)
                            Spacer()
                            if task.isCompleted {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                        }
                    }
                }
            }
            .navigationTitle("TaskMaster")
            .background(Color.customBackground)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddTaskView.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddTaskView) {
                AddTaskView(tasks: $tasks)
            }
        }
    }
}

#Preview {
    TaskListView()
}
