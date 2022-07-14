//
//  TaskCellTests.swift
//  ToDoAppTests
//
//  Created by Андрей  on 13.07.2022.
//

import XCTest
@testable import ToDoApp

class TaskCellTests: XCTestCase {
    
    var cell: TaskCell!
    
    override func setUpWithError() throws {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListViewController.self)) as! TaskListViewController
        controller.loadViewIfNeeded()
        
        let tableView = controller.tableView
        let dataSource = FakeDataSource()
        tableView?.dataSource = dataSource
        
        cell = tableView?.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: IndexPath(row: 0, section: 0)) as? TaskCell
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCellHasTitleLabel() {
        
        XCTAssertNotNil(cell.titleLable)
    }
    
    
    func testCellHasTitleLableInContentView() {
        
        XCTAssertTrue(cell.titleLable.isDescendant(of: cell.contentView))
    }
    
    func testCellHasLocationLabel() {
        
        XCTAssertNotNil(cell.locationLable)
    }
    
    
    func testCellHasLocationLableInContentView() {
        
        XCTAssertTrue(cell.locationLable.isDescendant(of: cell.contentView))
    }
    
    func testCellHasDateLabel() {
        
        XCTAssertNotNil(cell.dateLable)
    }
    
    
    func testCellHasDateLableInContentView() {
        
        XCTAssertTrue(cell.dateLable.isDescendant(of: cell.contentView))
    }
    
    func testConfigureSetsTitle() {
        
        let task = Task(title: "Foo")
        cell.configure(withTask: task)
        
        XCTAssertEqual(cell.titleLable.text, task.title)
    }
    
    func testConfigureSetsDate() {
        
        let task = Task(title: "Foo")
        cell.configure(withTask: task)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        let date = task.date
        let dateString = dateFormatter.string(from: date!)
        
        XCTAssertEqual(cell.dateLable.text, dateString)
    }
}

extension TaskCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            return UITableViewCell()
        }
        
        
        
    }
}
