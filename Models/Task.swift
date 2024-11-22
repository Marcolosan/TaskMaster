//
//  Task.swift
//  TaskMaster
//
//  Created by Marco Antonio López Sánchez on 15/11/24.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var details: String
    var isCompleted: Bool
    var date: Date
}


