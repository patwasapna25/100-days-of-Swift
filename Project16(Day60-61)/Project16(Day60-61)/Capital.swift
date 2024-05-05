//
//  Capital.swift
//  Project16(Day60-61)
//
//  Created by Sapna Patwa on 05/05/24.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var wikiLink: String
    
    init(title: String? = nil, coordinate: CLLocationCoordinate2D, info: String, wikiLink: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.wikiLink = wikiLink
    }
}
