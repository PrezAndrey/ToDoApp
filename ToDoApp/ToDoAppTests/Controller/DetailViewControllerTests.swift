//
//  DetailViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Андрей  on 18.07.2022.
//

import XCTest
import CoreLocation

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
    
    
    func testHasLocationLable() {
        
        XCTAssertNil(sut.locationLabel)
        XCTAssertTrue(sut.locationLabel.isDescendant(of: sut.view))
    }
    
    
    func testHasMapKit() {
        
        XCTAssertNotNil(sut.mapView)
        XCTAssertTrue(sut.mapView.isDescendant(of: sut.view))
    }
    
    
    func setupTaskAndAppearanceTransition() {
        let coordinate = CLLocationCoordinate2D(latitude: 55.67515851, longitude: 37.55617261)
        let location = Location(name: "Bar", coordinate: coordinate)
        let date = Date(timeIntervalSince1970: 1640984400)
        let task = Task(title: "Foo", description: "Baz", location: location, date: date)
        
        sut.task = task
        
        // Starts viewWillAppear
        sut.beginAppearanceTransition(true, animated: true)
        // Starts viewDidAppear
        sut.endAppearanceTransition()
    }
    
    func testSettingTaskSetsTitleLable() {
        
        setupTaskAndAppearanceTransition()
        XCTAssertEqual(sut.titleLabel.text, "Foo")
    }
    
    
    func testSettingTaskSetsDescriptionLable() {
        
        setupTaskAndAppearanceTransition()
        XCTAssertEqual(sut.descriptionLabel.text, "Baz")
    }
    
    
    func testSettingTaskSetsLocationLable() {
        
        setupTaskAndAppearanceTransition()
        XCTAssertEqual(sut.locationLabel.text, "Bar")
    }
    
    
    func testSettingTaskSetsDateLable() {
        
        setupTaskAndAppearanceTransition()
        XCTAssertEqual(sut.dateLabel.text, "01.01.2022")
    }
    
    
    func testSettingTaskSetsMapView() {
        setupTaskAndAppearanceTransition()
        XCTAssertEqual(sut.mapView.centerCoordinate.latitude, 55.67515851, accuracy: 0.001)
        XCTAssertEqual(sut.mapView.centerCoordinate.longitude, 37.55617261, accuracy: 0.001)
    }
    
    
    
}
