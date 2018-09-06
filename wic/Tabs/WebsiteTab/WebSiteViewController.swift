//
//  WebSiteViewController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-24.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit

class WebSiteViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    var link: String?
    
    @IBOutlet weak var justAnIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        
        if let link = link {
            webView.loadRequest(URLRequest(url: URL(string: link)!))
        }
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        justAnIndicator.startAnimating()
        
        
        return true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        justAnIndicator.stopAnimating()
    }
}
