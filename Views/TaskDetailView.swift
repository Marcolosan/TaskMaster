//
//  TaskDetailView.swift
//  TaskMaster
//
//  Created by Marco Antonio López Sánchez on 22/11/24.
//

import SwiftUI

struct TaskDetailView: View {
    var task: Task

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(task.title)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.customText)
            
            Text(task.details)
                .font(.body)
                .foregroundColor(.customSecondaryText)
            
            Text(task.date, style: .date)
                .font(.caption)
                .foregroundColor(.customSecondaryText)
            
            HStack {
                Text("Completed:")
                    .font(.headline)
                    .foregroundColor(.customText)
                Spacer()
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .red)
                    .font(.title)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.customBackground)
        .navigationTitle("Task Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let sampleTask = Task(
        title: "Sample Task",
        details: "This is a detailed description of the sample task.",
        isCompleted: false,
        date: Date()
    )
    TaskDetailView(task: sampleTask)
}
