//
//  socialMediaIButtons.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-24.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit

class SocialMediaButtons {
    func openWebsite(name: String) {
        let newName = name.components(separatedBy: ":")
        switch newName[0] {
        case "fb", "twitter":
            let nameOfWebsite = "https://" + newName[0] + ".com/uwindsormsa"
            UIApplication.shared.openURL(NSURL(string: nameOfWebsite) as! URL)
        case "youtube":
            let nameOfWebsite = "https://" + newName[0] + ".com/uwindsormsa1"
            UIApplication.shared.openURL(NSURL(string: nameOfWebsite) as! URL)
        default:
            return
        }
    }
    
    func openAnApp(name: String) {
        UIApplication.shared.openURL(NSURL(string: name) as! URL)
    }
    
    func checkIfAppExist(name: String) {
        
        if UIApplication.shared.canOpenURL(NSURL(string: name) as! URL) {
            switch name {
            case "fb://":
                openAnApp(name: "fb://profile/168973516524415")
            case "twitter://":
                openAnApp(name: name + "/user?screen_name=uwindsormsa")
            case "youtube://":
                openAnApp(name: name + "uwindsormsa1")
            case "snapchat://":
                openAnApp(name: "snapchat://add/uwindsormsa")
            default:
                return
            }
            
        } else {
            openWebsite(name: name)
        }
    }
    
}
