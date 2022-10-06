//
//  NewTaskViewcontrollerTests.swift
//  ToDoAppTests
//
//  Created by Андрей  on 17.08.2022.
//

import XCTest

@testable import ToDoApp
import CoreLocation

class NewTaskViewControllerTests: XCTestCase {

    var sut: NewTaskViewController!
    var placemark: MockCLPlacemark!
    
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
<<<<<<< HEAD
        
        XCTAssertTrue(sut.saveButton.isDescendant(of: sut.view))
    }
    
    func testHasCancelButton() {
        
        XCTAssertTrue(sut.cancelButton.isDescendant(of: sut.view))
=======
        XCTAssertTrue(sut.saveButton.isDescendant(of: sut.view))
    }
    
    
    func testHasCancelButton() {
        XCTAssertTrue(sut.cancelButton.isDescendant(of: sut.view))
    }
    
    
    func testSaveUSersGeocoderToConvertCoordinateFromAddress() {

        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        let date = df.date(from:"01.01.22")

        sut.titleTextField.text = "Foo"
        sut.locationTextField.text = "Bar"
        sut.dateTextField.text = "01.01.22"
        sut.locationTextField.text = "Москва"
        sut.descriptionTextField.text = "Baz"

        sut.taskManager = TaskManager()
        let mockGeocoder = MockClGeocoder()
        sut.geocoder = mockGeocoder

        sut.save()
        
        let coordinate = CLLocationCoordinate2D(latitude: 37.6192919, longitude: 55.7586642)
        let location = Location(name: "Москва", coordinate: coordinate)
        let generatedTask = Task(title: "Foo", description: "Baz", location: location, date: date)
        
        placemark = MockCLPlacemark()
        placemark.mockCoordinate = coordinate
        mockGeocoder.completionHandler?([placemark], nil)
        
        let task = sut.taskManager.getTask(at: 0)

        XCTAssertEqual(task, generatedTask)
>>>>>>> 4250c8b66e83003e5833fd1eb8ee9555a859460b
    }
    
    
    func testSaveButtonHasSaveMethod() {
        
        let saveButton = sut.saveButton
        
        guard let actions = saveButton?.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail()
            return
        }
    }
}



extension NewTaskViewControllerTests {
    
    class MockClGeocoder: CLGeocoder {
        
        var completionHandler: CLGeocodeCompletionHandler?
        
        override func geocodeAddressString(_ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler) {
            self.completionHandler = completionHandler
        }
    }
    
    
    class MockCLPlacemark: CLPlacemark {
        
        var mockCoordinate: CLLocationCoordinate2D!
        
        override var location: CLLocation? {
            return CLLocation(latitude: mockCoordinate.latitude, longitude: mockCoordinate.longitude)
        }
    }
}
