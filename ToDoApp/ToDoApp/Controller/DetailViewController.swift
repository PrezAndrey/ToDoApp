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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.titleLabel.text = task.title
        self.descriptionLabel.text = task.description
        self.locationLabel.text = task.location?.name
    }
    
}
