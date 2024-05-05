//
//  ViewController.swift
//  Project16(Day60-61)
//
//  Created by Sapna Patwa on 05/05/24.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Map"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(changeMapType))
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.", wikiLink: "https://en.wikipedia.org/wiki/London")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.", wikiLink: "https://en.wikipedia.org/wiki/Oslo")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.", wikiLink: "https://en.wikipedia.org/wiki/Paris")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.", wikiLink: "https://en.wikipedia.org/wiki/Rome")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.", wikiLink: "https://en.wikipedia.org/wiki/Washington")
        let mumbai = Capital(title: "Mumbai", coordinate: CLLocationCoordinate2D(latitude: 19.0760, longitude: 72.8777), info: "Called the city of dreams.", wikiLink: "https://en.wikipedia.org/wiki/Mumbai")
        
        mapView.addAnnotations([london, oslo, paris, rome, washington, mumbai])
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else {
            return nil
        }
        
        let identifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            annotationView?.markerTintColor = .blue
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else {
            return 
        }
        
        let placeName = capital.title
        let placeInfo = capital.info
        
//        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default))
//        present(ac, animated: true)
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            navigationController?.pushViewController(vc, animated: true)
            vc.capitalCity = capital
        }
    }
    
    @objc func changeMapType() {
        let ac = UIAlertController(title: "Select Type", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Standard", style: .default) { [weak self] _ in
            self?.mapView.mapType = MKMapType.standard
        })
        ac.addAction(UIAlertAction(title: "Satellite", style: .default) { [weak self] _ in
            self?.mapView.mapType = MKMapType.satellite
        })
        present(ac, animated: true)
    }
}

