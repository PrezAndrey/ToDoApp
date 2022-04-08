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
    
    func testChangeTasksAtIndexChangesCount() {
        let task = Task(title: "Foo")
        sut.addTask(task: task)
        
        sut.checkTask(at: 0)
        
        XCTAssertEqual(sut.tasksCount, 0)
        XCTAssertEqual(sut.doneTasksCount, 1)
    }
    
    func testCheckedTaskRemovedFromTasks() {
        let firstTask = Task(title: "Foo")
        let secondTask = Task(title: "Bar")
        
        sut.addTask(task: firstTask)
        sut.addTask(task: secondTask)
        
        sut.checkTask(at: 0)
        
        XCTAssertEqual(sut.getTask(at: 0).title, "Bar")
    }
    
    func testDoneTaskReturnsAtCheckedTasks() {
        let task = Task(title: "Foo")
        sut.addTask(task: task)
        
        sut.checkTask(at: 0)
        
        let returnedTask = sut.doneTask(at: 0)
        
        XCTAssertEqual(returnedTask.title, task.title)
        
    }
    
    func testRemoveAllResultsCountsBeZero() {
        let firstTask = Task(title: "Foo")
        let secondTask = Task(title: "Bar")
        
        sut.addTask(task: firstTask)
        sut.addTask(task: secondTask)
        
        sut.checkTask(at: 0)
        
        sut.removeAllTasks()
        
        XCTAssertEqual(sut.tasksCount, 0)
        XCTAssertEqual(sut.doneTasksCount, 0)
    }
    
    func testAddingSameObjectDoesNotIncrementCount() {
        sut.addTask(task: Task(title: "Foo"))
        sut.addTask(task: Task(title: "Foo"))
        
        XCTAssertEqual(sut.tasksCount, 1)
        
    }
   

}
