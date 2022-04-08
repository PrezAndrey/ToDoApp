//
//  TaskTests.swift
//  ToDoAppTests
//
//  Created by Андрей  on 08.04.2022.
//

import XCTest
@testable import ToDoApp


class TaskTests: XCTestCase {

    // Red Gren Refactor
   
    // Task lable initialization test
   func testInitTaskWithTitle() {
       // given
       let task = Task(title: "Foo")
       // when
       // then
       XCTAssertNotNil(task)
   }
   
   // Can we make a task with title and description
   func testInitTaskWithTitleAndDescription() {
       // given
       let task = Task(title: "Foo", description: "Bar")
       // when
       // then
       XCTAssertNotNil(task)
   }
   
   func testWhenGivenTitleSetsTitle() {
       
       let task = Task(title: "Foo")
       
       
       XCTAssertEqual(task.title, "Foo")
   }
   
   func testWhenGivenDescriptionSetsDescription() {
       
       let task = Task(title: "Bar", description: "this is a Foo")
       
       XCTAssertTrue(task.description == "this is a Foo")
   }
   
   
   func testTaskInitsDate() {
       
       let task = Task(title: "Baz")
       
       XCTAssertNotNil(task.date)
   }
   
   
   func testWhenGivenLocationSetsLocation() {
       
       let location = Location(name: "Foo")
       
       let task = Task(title: "Bar", description: "Baz", location: location)
       
       XCTAssertEqual(location, task.location)
   }
   

   

}
