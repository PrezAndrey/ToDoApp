//
//  DataProviderTests.swift
//  ToDoAppTests
//
//  Created by Андрей  on 12.04.2022.
//

import XCTest

@testable import ToDoApp

class DataProviderTests: XCTestCase {
    
    var sut: DataProvider!
    var tableView: UITableView!

    override func setUpWithError() throws {
        sut = DataProvider()
        tableView = UITableView()
        tableView.dataSource = sut
        sut.taskManager = TaskManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testNumberOfSectionsIsTwo() {
        
        let numberOfSections = tableView.numberOfSections
        
        XCTAssertEqual(numberOfSections, 2)
        
    }
    
    
    func testNumberOfRowsInSectionZeroIsTaskCount() {
        
        sut.taskManager = TaskManager()
        
        sut.taskManager?.addTask(task: Task(title: "Foo"))
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        
        sut.taskManager?.addTask(task: Task(title: "Bar"))
        
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
        

    }
    
    
    func testNumberOfRowsInSectionOneIsDoneTaskCount() {
        
        
        
        sut.taskManager?.addTask(task: Task(title: "Foo"))
        
        sut.taskManager?.checkTask(at: 0)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        
        
        sut.taskManager?.addTask(task: Task(title: "Bar"))
        
        sut.taskManager?.checkTask(at: 0)
        
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
        

    }
    
    
    func testSellForRowAtIndexPathReturnsTaskSell() {
        
       
        sut.taskManager?.addTask(task: Task(title: "Foo"))
        
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        
        XCTAssertTrue(cell is TaskCell)
        
    }
}
