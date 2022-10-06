//
//  NewTaskViewcontrollerTests.swift
//  ToDoAppTests
//
//  Created by Андрей  on 17.08.2022.
//

import XCTest

@testable import ToDoApp

class NewTaskViewControllerTests: XCTestCase {

    var sut: NewTaskViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: String(describing: NewTaskViewController.self)) as? NewTaskViewController
        
        sut.loadViewIfNeeded()
        
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testHasTitleTextfield() {
        
        XCTAssertTrue(sut.titleTextField.isDescendant(of: sut.view))
    }
    
    
    func testHasLocationTextField() {
        
        XCTAssertTrue(sut.locationTextField.isDescendant(of: sut.view))
    }
    
    
    func testHasDateTextField() {
        
        XCTAssertTrue(sut.dateTextField.isDescendant(of: sut.view))
    }
    
    
    func testHasAddressTextField() {
        
        XCTAssertTrue(sut.addressTextField.isDescendant(of: sut.view))
    }
    
    
    func testHasDescriptionTextField() {
        
        XCTAssertTrue(sut.descriptionTextField.isDescendant(of: sut.view))
    }
    
    func testHasSaveButton() {
        
        XCTAssertTrue(sut.saveButton.isDescendant(of: sut.view))
    }
    
    func testHasCancelButton() {
        
        XCTAssertTrue(sut.cancelButton.isDescendant(of: sut.view))
    }
    
    

    
}
