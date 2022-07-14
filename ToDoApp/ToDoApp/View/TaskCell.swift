//
//  TaskCell.swift
//  ToDoApp
//
//  Created by Андрей  on 13.04.2022.
//

import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var locationLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    
    func configure(withTask task: Task) {}
    

}
