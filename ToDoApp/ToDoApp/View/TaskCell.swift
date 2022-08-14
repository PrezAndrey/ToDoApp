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
    
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        
        return df
    }
    
    
    func configure(withTask task: Task, done: Bool = false) {
        
        if done {
            let attributedString = NSAttributedString(string: task.title, attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue])
            self.titleLable.attributedText = attributedString
            self.locationLable = nil
            self.dateLable = nil
            
        } else {
            let dateString = dateFormatter.string(from: task.date)
            self.dateLable.text = dateString
            self.titleLable.text = task.title
            self.locationLable.text = task.location?.name
        }
        
        
    }
}
