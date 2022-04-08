//
//  TaskManager.swift
//  ToDoApp
//
//  Created by Андрей  on 08.04.2022.
//

import Foundation


class TaskManager {
    var tasksCount = 0
    let doneTasksCount = 0
    
    func addTask(task: Task) {
        
        tasksCount += 1
    }
    
    func getTask(at: Int) -> Task {
        return Task(title: "")
    }
}
