//
//  Person.swift
//  MilestoneProject(Day50)
//
//  Created by Sapna Patwa on 25/04/24.
//

import Foundation


class Person: NSObject {
    var name: String
    var imageName: String
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}
