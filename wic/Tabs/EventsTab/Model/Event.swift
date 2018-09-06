//
//  Event.swift
//  uwindsormsa
//
//  Created by may on 2016-09-12.
//  Copyright © 2016 may. All rights reserved.
//
import Firebase
import UIKit

class Event {
    
    // we add "?" so that we don't have to add the var to init()
    var description: String?
    var name: String?
    var start: String?
    var end: String?
    var image: UIImage?
    var place: String?
    var owner: String?
    var lat: Double?
    var long: Double?
    var location = false
    var link: String?
    var ref = DatabaseReference()
    
    init(name: String, start: String, end: String, description: String, image: UIImage, place: String, owner: String, lat: Double, long: Double, location: Bool)
    {
        self.location = location
        self.name = name
        self.description = description
        self.image = image
        self.start = start
        self.end = end
        self.place = place
        self.owner = owner
        self.long = long
        self.lat = lat
    }
    
    init(snapshot : DataSnapshot){
        
        let childSnapshot = snapshot.value as? [String : Any]
        name = childSnapshot?["name"] as? String
        
        let cover = childSnapshot?["cover"] as? [String : Any]
        link = cover?["source"] as? String
        try? image = UIImage(data: Data(contentsOf: URL(string: link!)!))
        
        owner = childSnapshot?["owner"] as? String
        
        start = childSnapshot?["start_time"] as? String
        end = childSnapshot?["end_time"] as? String
    
        description = (childSnapshot?["description"] as? String)
        
        let geo = childSnapshot?["place"] as? [String : AnyObject]
        
        if let placeName = geo?["name"] as? String {
            place = placeName
            
            if let loc = geo?["location"] as? [String : AnyObject] {
                location = true
                lat = loc["latitude"] as? Double
                long = loc["longitude"] as? Double
            }
        }
    }
}
