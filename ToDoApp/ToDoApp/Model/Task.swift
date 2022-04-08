//
//  Task.swift
//  ToDoApp
//
//  Created by Андрей  on 08.04.2022.
//

import Foundation

struct Task: Equatable {
    var title: String
    var description: String?
    private(set) var date: Date?
    var location: Location?
    
    init(title: String, description: String? = nil, location: Location? = nil) {
        self.title = title
        self.description = description
        self.date = Date()
        self.location = location
        
    }
}
