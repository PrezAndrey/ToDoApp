//
//  DetailViewController.swift
//  ToDoApp
//
//  Created by Андрей  on 18.07.2022.
//


import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var mapView: MKMapView!
    
    var task: Task!
    
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyyy"
        
        return df
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.titleLabel.text = task.title
        self.descriptionLabel.text = task.description
        self.locationLabel.text = task.location?.name
        self.dateLabel.text = dateFormatter.string(from: task.date)
        
        if let coordinate = task.location?.coordinate {
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
            
            mapView.region = region
        }
    }
    
}
