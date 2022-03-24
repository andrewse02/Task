//
//  TaskDetailViewController.swift
//  Task
//
//  Created by Andrew Elliott on 3/23/22.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    var task: Task?
    var date: Date?

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskDueDatePicker.contentHorizontalAlignment = .leading
        taskDueDatePicker.contentVerticalAlignment = .center
        
        updateViews()
    }
    
    func updateViews() {
        guard let task = task else { return }
        
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        taskDueDatePicker.date = task.dueDate ?? Date()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let task = task {
            TaskController.shared.updateTask(task, name: taskNameTextField.text, notes: taskNotesTextView.text, dueDate: taskDueDatePicker.date)
        } else {
            guard let nameText = taskNameTextField.text else { return }
            TaskController.shared.createTask(name: nameText, notes: taskNotesTextView.text, dueDate: taskDueDatePicker.date)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dueDatePickerDateChanged(_ sender: Any) {
        date = taskDueDatePicker.date
    }
    
}
