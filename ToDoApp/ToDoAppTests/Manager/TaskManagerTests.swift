//
//  TaskManagerTests.swift
//  ToDoAppTests
//
//  Created by Андрей  on 08.04.2022.
//

import XCTest
@testable import ToDoApp


class TaskManagerTests: XCTestCase {
    
    var sut: TaskManager!
    
    

    override func setUpWithError() throws {
        sut = TaskManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testInitTaskManagerWithZeroTasks() {
        
        XCTAssertEqual(sut.tasksCount, 0)
    }
    
    
    
    
    func testInitTaskManagerWithZeroDoneTasks() {
        
        XCTAssertEqual(sut.doneTasksCount, 0)
    }
    
    
    
    func testAddTaskIncrementTaskCount() {
        let task = Task(title: "Foo")
        
        sut.addTask(task: task)
        
        XCTAssertEqual(sut.tasksCount, 1)
    }
    
    
    
    func testTaskAtIndexIsAddedTask() {
        let task = Task(title: "Foo")
        sut.addTask(task: task)
        
        let returnedTask = sut.getTask(at: 0)
        
        XCTAssertEqual(returnedTask.title, task.title)
    }
   

}
