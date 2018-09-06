//
//  TwitterTableViewController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-16.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit
import TwitterKit
//import Crashlytics

class TwitterTableViewController: TWTRTimelineViewController {

    func showTimeline() {
        
             let client = TWTRAPIClient()
        
        
        self.dataSource = TWTRUserTimelineDataSource(screenName: "WindsorIslamicC",
                                                     userID: nil,
                                                     apiClient: client,
                                                     maxTweetsPerRequest: 15,
                                                     includeReplies: false,
                                                     includeRetweets: true)
//    }
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
       //self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
        
//        let client = TWTRAPIClient()
//        self.dataSource = TWTRListTimelineDataSource(listSlug: "test", listOwnerScreenName: "WindsorIslamicC", APIClient: client)
//        var dataSource = TWTRUserTimelineDataSource(screenName: "WindsorIslamicC", apiClient: TWTRAPIClient())
//        dataSource.includeReplies = true
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showTimeline()
        
       // showTimeline
    }
}
