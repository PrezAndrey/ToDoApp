//
//  DataProvider.swift
//  ToDoApp
//
//  Created by Андрей  on 12.04.2022.
//

import Foundation
import UIKit

enum Section: Int, CaseIterable {
    case toDo
    case done
}

class DataProvider: NSObject {
    
    var taskManager: TaskManager?
    
}

extension DataProvider: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        
        switch section {
        case .toDo:
            return "Done"
        case .done:
            return "Undone"
        }
    }
}


extension DataProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        guard let section = Section(rawValue: section) else { fatalError() }
        guard let taskManager = taskManager else { return 0 }
        
        switch section {
        case .toDo:
            return taskManager.tasksCount
        case .done:
            return taskManager.doneTasksCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: indexPath) as! TaskCell
        
        
        let task: Task
        
        guard let section = Section(rawValue: indexPath.section), let taskManager = taskManager else { fatalError() }
        
        switch section {
        case .toDo:
            task = taskManager.getTask(at: indexPath.row)
        case .done:
            task = taskManager.doneTask(at: indexPath.row)
        }
        
       
        cell.configure(withTask: task)
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
    
        return Section.allCases.count
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard let section = Section(rawValue: indexPath.section), let taskManager = taskManager else { fatalError() }
        
        switch section {
        case .toDo:
            taskManager.checkTask(at: indexPath.row)
        case .done:
            taskManager.uncheckTask(at: indexPath.row)
        }
    
        tableView.reloadData()
    }
    
    
    
    
    
    
}
