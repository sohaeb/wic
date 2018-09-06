//
//  EventDetailsViewController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-22.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit
import MapKit

protocol HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark)
}

class EventDetailsViewController: UIViewController {
    
    var value: String?
    var lat: Double? = nil
    var long: Double? = nil
    var imageOfEvent: UIImage?
    var name: String?
    var locationExist: Bool?
    var nameOfTheEvent: String?
    var selectedPin:MKPlacemark? = nil
    
    @IBOutlet weak var nameOfEvent: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var descriptionOutlet: UILabel!
    
    func centerMapOnLocation(location: CLLocation) {
        
        //("here10")
        
        if (locationExist)! {
            
            //("here14")
            let regionRadius: CLLocationDistance = 1500
            //("here15")
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
            //("here16")
            mapView.setRegion(coordinateRegion, animated: true)
            //("here17")
            
        } else {
         
            /////////////
//            //("here11")
            let regionRadius: CLLocationDistance = 7000
            //("here12")
            //MKCoordinateRegionM
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
            //("here13")
            mapView.setRegion(coordinateRegion, animated: true)
            
        }
        //mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //("here1")
        
        let something = CLLocation(latitude: (lat!), longitude: (long!))
        //("here2")
        
        centerMapOnLocation(location: something)
        //("here3")
        
        self.navigationItem.title = name
        //("here4")
        
        //if let value = value {
        descriptionOutlet.text = value
        //("here5")
        
        //}
        //("here6")
        
        if let name = nameOfTheEvent {
            //("here7")
            
            nameOfEvent.text = name
        }
        
        //("here8")
        
        if let imageOfEvent = imageOfEvent {
            //("here9")
            imageOutlet.image = imageOfEvent
        }
    }
}

//extension ViewController: HandleMapSearch {
//    func dropPinZoomIn(placemark:MKPlacemark){
//        // cache the pin
//        selectedPin = placemark
//        // clear existing pins
//        mapView.removeAnnotations(mapView.annotations)
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = placemark.coordinate
//        annotation.title = placemark.name
//        if let city = placemark.locality,
//            let state = placemark.administrativeArea {
//            annotation.subtitle = "(city) (state)"
//        }
//        mapView.addAnnotation(annotation)
//        let span = MKCoordinateSpanMake(0.05, 0.05)
//        let region = MKCoordinateRegionMake(placemark.coordinate, span)
//        mapView.setRegion(region, animated: true)
//    }
//}
