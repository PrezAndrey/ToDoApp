//
//  TaskListViewControllerTest.swift
//  ToDoAppTests
//
//  Created by Андрей  on 08.04.2022.
//

import XCTest
@testable import ToDoApp


class TaskListViewControllerTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTableViewIsNotNilWhenViewIsLoaded() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TaskListVC")
        let sut = vc as! TaskListViewController
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.tableView)
    }

    

}
