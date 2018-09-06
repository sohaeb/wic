//
//  AboutViewController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-16.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    let socialMediaClass = SocialMediaButtons()
        
    @IBAction func ClickableButton(_ sender: UIButton) {
        if let id = sender.restorationIdentifier {
            switch id {
            case "1":
                socialMediaClass.checkIfAppExist(name: "fb://")
            case "2":
                socialMediaClass.checkIfAppExist(name: "twitter://")
            case "3":
                socialMediaClass.checkIfAppExist(name: "youtube://")
            case "4":
                socialMediaClass.checkIfAppExist(name: "snapchat://")
            case "5":
                UIApplication.shared.openURL(NSURL(string: "http://uwindsormsa.com/mailing-list/") as! URL)
            case "6":
                UIApplication.shared.openURL(NSURL(string: "http://uwindsormsa.com/volunteer") as! URL)
            default:
                UIApplication.shared.openURL(NSURL(string: "mailto://msa@uwindsor.ca") as! URL)
            }
        }
    }
    
    @IBAction func mailButtonForDesignPage(_ sender: UIButton) {
        
        UIApplication.shared.openURL(NSURL(string: "mailto://snabieel@gmail.com") as! URL)
    }
}
