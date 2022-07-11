//
//  TaskManager.swift
//  ToDoApp
//
//  Created by Андрей  on 08.04.2022.
//

import Foundation


class TaskManager {
    
    
    
    var tasksCount: Int {
        return tasks.count
    }
    var doneTasksCount: Int {
        return doneTasks.count
    }
    
    private var tasks: [Task] = []
    private var doneTasks: [Task] = []
    
    func addTask(task: Task) {
        if !tasks.contains(task) {
            tasks.append(task)
        }
        
    }
    
    func getTask(at index: Int) -> Task {
        return tasks[index]
    }
    
    
    func checkTask(at index: Int) {
        let task = tasks.remove(at: index)
        doneTasks.append(task)
    }
    
    
    func uncheckTask(at index: Int) {
        let task = doneTasks.remove(at: index)
        tasks.append(task)
    }
    
    
    func doneTask(at index: Int) -> Task {
        return doneTasks[index]
    }
    
    func removeAllTasks() {
        tasks.removeAll()
        doneTasks.removeAll()
    }
    
    
    
    

}
