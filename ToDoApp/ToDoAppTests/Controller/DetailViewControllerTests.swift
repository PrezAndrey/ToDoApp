//
//  DetailViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Андрей  on 18.07.2022.
//

import XCTest

@testable import ToDoApp

class DetailViewControllerTests: XCTestCase {
    
    var sut: DetailViewController!
    

    override func setUpWithError() throws {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as! DetailViewController
       sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHasTitleLable() {
        
        XCTAssertNotNil(sut.titleLabel)
        XCTAssertTrue(sut.titleLabel.isDescendant(of: sut.view))
    }
    
    
    func testHasDescriptionLable() {
        
        XCTAssertNotNil(sut.descriptionLabel)
        XCTAssertTrue(sut.descriptionLabel.isDescendant(of: sut.view))
    }
    
    
    func testHasDateLabel() {
        
        XCTAssertNotNil(sut.dateLabel)
        XCTAssertTrue(sut.dateLabel.isDescendant(of: sut.view))
    }
    
    
    func testHasMapKit() {
        
        XCTAssertNotNil(sut.mapView)
        XCTAssertTrue(sut.mapView.isDescendant(of: sut.view))
    }

}
