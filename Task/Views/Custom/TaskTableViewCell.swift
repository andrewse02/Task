//
//  TaskTableViewCell.swift
//  Task
//
//  Created by Andrew Elliott on 3/24/22.
//

import UIKit

protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    weak var delegate: TaskCompletionDelegate?
    
    @IBAction func completionButtonTapped(_ sender: Any) {
        guard let delegate = delegate else { return }
        delegate.taskCellButtonTapped(self)
    }
    
    func updateViews() {
        guard let task = task else { return }
        
        taskNameLabel.text = task.name
        completionButton.setBackgroundImage(UIImage(named: task.isComplete ? "complete" : "incomplete"), for: .normal)
    }
}
