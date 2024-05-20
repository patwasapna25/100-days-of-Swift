//
//  Note.swift
//  MilestoneProject-Day74
//
//  Created by Sapna Patwa on 20/05/24.
//

import Foundation


class Note: NSObject, Codable {
    var text: String
    
    init(text: String) {
        self.text = text
    }
}
