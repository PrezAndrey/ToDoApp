//
//  TaskListViewController.swift
//  ToDoApp
//
//  Created by Андрей  on 08.04.2022.
//

import Foundation
import UIKit

class TaskListViewController: UIViewController {
    
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView()
    }
}
