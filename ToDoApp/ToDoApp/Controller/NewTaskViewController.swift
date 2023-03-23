//
//  NewTaskViewController.swift
//  ToDoApp
//
//  Created by Андрей  on 17.08.2022.
//

import UIKit
import CoreLocation

class NewTaskViewController: UIViewController {

    var taskManager: TaskManager!
    var geocoder = CLGeocoder()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBAction func save() {
        let titleString = titleTextField.text
        let locationString = locationTextField.text
        let date = dateFormatter.date(from: dateTextField.text!)
        let descriptionString = descriptionTextField.text
        let addressString = addressTextField.text
        geocoder.geocodeAddressString(addressString!) { [unowned self] (placemarks, error) in
            let placemark = placemarks?.first
            let coordinates = placemark?.location?.coordinate
            let location = Location(name: locationString!, coordinate: coordinates)
            let task = Task(title: titleString!, description: descriptionString!, location: location, date: date)
            self.taskManager.addTask(task: task)
            
        }
    }
    
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }
}
