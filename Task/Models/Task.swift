//
//  Task.swift
//  Task
//
//  Created by Andrew Elliott on 3/23/22.
//

import Foundation

class Task: Codable {
    var name: String
    var notes: String?
    var dueDate: Date?
    var isComplete: Bool

    init(name: String, notes: String?, dueDate: Date?, isComplete: Bool? = false) {
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete ?? false
    }
}

extension Task: Equatable {
    static func ==(lhs: Task, rhs: Task) -> Bool {
        guard lhs.name == rhs.name,
              lhs.notes == rhs.notes,
              lhs.dueDate == rhs.dueDate,
              lhs.isComplete == rhs.isComplete else { return false }
        return true
    }
}
