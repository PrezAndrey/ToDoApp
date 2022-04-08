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
    
    private var taskArray: [Task] = []
    
    func addTask(task: Task) {
        tasksCount += 1
        taskArray.append(task)
    }
    
    func getTask(at index: Int) -> Task {
        return taskArray[index]
    }
}
