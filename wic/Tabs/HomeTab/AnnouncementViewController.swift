//
//  SwifterViewController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-27.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit
import SwifteriOS

class AnnouncementViewController: UIViewController {
    
    @IBOutlet weak var dateOfTweetLabel: UILabel!
    @IBOutlet weak var textField: UITextView!
    
    var tweet = ""
    
    func parstingTwitter () {
        
        let another = Swifter(consumerKey: TwitterKeys.consumerKey , consumerSecret: TwitterKeys.consumerSecret , oauthToken: TwitterKeys.outhToken, oauthTokenSecret: TwitterKeys.outhSecret	)
        
        another.getTimeline(for: "742050879558160384", count: 18, sinceID: nil, maxID: nil, trimUser: false, contributorDetails: true, includeEntities: true, success: { (json) in
            
            for i in json.array! {
                
                if let _ = i["retweeted_status"]["id_str"].string {
                    continue
                }
                
                if let dateOfTweet = i["created_at"].string {
                    
                    let newDate = dateOfTweet.components(separatedBy: " ")
                    
                    self.dateOfTweetLabel.text = "(" + "Date: " + newDate[0] + " " + newDate[1] + " " + newDate[2] + ")"
                }
                if let textofTweet = i["text"].string {
                    let modifiedText = textofTweet.replacingOccurrences(of: "amp;", with: "")
                    self.textField.text = modifiedText
                    break
                    
                } // end of assigining tweet
            } // end of for loop
            
        }) { (error) in
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        self.parstingTwitter()
        
    }
}
