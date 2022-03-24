//
//  TaskController.swift
//  Task
//
//  Created by Andrew Elliott on 3/23/22.
//

import Foundation

class TaskController {

    static let shared = TaskController()
    
    var tasks: [Task] = []
    
    func createTask(name: String, notes: String?, dueDate: Date?) {
        let newTask = Task(name: name, notes: notes, dueDate: dueDate)
        tasks.append(newTask)
        
        saveToPersistentStorage()
    }
    
    func updateTask(_ task: Task, name: String?, notes: String?, dueDate: Date?) {
        task.name = name ?? task.name
        task.notes = notes ?? task.notes
        task.dueDate = dueDate ?? task.dueDate
        
        saveToPersistentStorage()
    }
    
    func toggleComplete(task: Task) {
        task.isComplete = !task.isComplete
        
        saveToPersistentStorage()
    }
    
    func deleteTask(_ task: Task) {
        guard let index = tasks.firstIndex(of: task) else { return }
        tasks.remove(at: index)
        
        saveToPersistentStorage()
    }
    
    func deleteTask(at index: Int) {
        guard tasks.indices.contains(index) else { return }
        tasks.remove(at: index)
        
        saveToPersistentStorage()
    }
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectoryURL = urls[0].appendingPathComponent("Task.json")
        return documentsDirectoryURL
    }
    
    func saveToPersistentStorage() {
        let je = JSONEncoder()
        
        do {
            let data = try je.encode(self.tasks)
            try data.write(to: self.fileURL())
        } catch {
            print(error)
        }
    }
    
    func loadFromPersistentStorage() {
        do {
            let data = try Data(contentsOf: self.fileURL())
            let jd = JSONDecoder()
            
            let tasks = try jd.decode([Task].self, from: data)
            self.tasks = tasks
        } catch {
            print(error)
        }
    }
}
