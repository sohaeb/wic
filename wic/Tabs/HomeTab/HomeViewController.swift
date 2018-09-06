//
//  ViewController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-12.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit
import DeviceKit
import SwifteriOS
import Crashlytics
import Firebase

class HomeViewController: UIViewController {
    
    // MARK:
    // MARK: Variables
    let obj = EventsTableViewController()
    let prayerTimesFunc = PrayerTimes()
    let device = Device()
    
    // MARK:
    // MARK: Outlets
    
    @IBOutlet weak var embeddedView: UIView!
    @IBOutlet weak var weatherStackView: UIStackView!
    @IBOutlet weak var tabBar: UITabBarItem!
    @IBOutlet weak var textField: UITextView!
    
    @IBOutlet weak var firstJumuahLabel: UILabel!
    @IBOutlet weak var secondJumuahLabel: UILabel!
    @IBOutlet weak var firstLocationJumLabel: UILabel!
    @IBOutlet weak var secondJumLocationLabel: UILabel!
    
    @IBOutlet weak var fajirAthan: UILabel!
    @IBOutlet weak var fajirIqama: UILabel!
    @IBOutlet weak var duhurAthan: UILabel!
    @IBOutlet weak var duhurIqamah: UILabel!
    @IBOutlet weak var asrAthan: UILabel!
    @IBOutlet weak var asrIqamah: UILabel!
    @IBOutlet weak var maghribAthan: UILabel!
    @IBOutlet weak var maghribIqamah: UILabel!
    @IBOutlet weak var ishaAthan: UILabel!
    @IBOutlet weak var ishaIqamah: UILabel!
    
    // MARK:
    // MARK: Outlets Constraints
    
    @IBOutlet weak var iqamaToPrayerLabel:NSLayoutConstraint!
    @IBOutlet weak var JumuahToBlackLine: NSLayoutConstraint!
    @IBOutlet weak var qiblahConstraint: NSLayoutConstraint!
    @IBOutlet weak var iqamahStackToRightBorder: NSLayoutConstraint!
    @IBOutlet weak var weatherStackToLeftBorder: NSLayoutConstraint!
    @IBOutlet weak var topOfUwindsMSABanner: NSLayoutConstraint!
    @IBOutlet weak var topOfMiddleTopBanner: NSLayoutConstraint!
    @IBOutlet weak var topOf1stJumuahToBotOfWeather: NSLayoutConstraint!
    @IBOutlet weak var paryerTimesTitleToWeatherStackTop: NSLayoutConstraint!
    @IBOutlet weak var prayerTimesTitleToBlackLine: NSLayoutConstraint!
    @IBOutlet weak var constraintFromBotOfBorderToBottom: NSLayoutConstraint!
    
    // MARK:
    // MARK: Actions
    
    //    @IBAction func urlToPlay(_ sender: AnyObject) {
    //        PlayingAudio.play()
    //    }
    
    // MARK:
    // MARK: Methods
    
    func readTokenFromFirebase() {
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        // Read from DB
        ref.child("users").child("place UUID from plist").observeSingleEvent(of: .value, with: { (snapshot) in
            
            // Check if user already exists
            guard !snapshot.exists() else {
                // self.performSegue(withIdentifier: "signIn", sender: nil)
                return
            }
            
            //otherwise, create UUID and save it
            
        })
    }
    
    func parstingTwitter () {
        // This function parse the timings + location of Jumuahs from @sohaeb
        // twitter account based on the 1st tweet.
        
        let another = Swifter(consumerKey: TwitterKeys.consumerKey , consumerSecret: TwitterKeys.consumerSecret , oauthToken: TwitterKeys.outhToken, oauthTokenSecret: TwitterKeys.outhSecret	)
        
        another.getTimeline(for: "742050879558160384", count: 1, sinceID: nil, maxID: nil, trimUser: false, contributorDetails: true, includeEntities: true, success: { (json) in
            
            for i in json.array! {
                if i["text"].string?.contains("#Jumuah") == true {
                    if let arrayOfText = i["text"].string?.components(separatedBy: ",") {
                        self.firstJumuahLabel.text = arrayOfText[0]
                        self.secondJumuahLabel.text = arrayOfText[1]
                        self.firstLocationJumLabel.text = arrayOfText[2];
                        self.secondJumLocationLabel.text = arrayOfText[3];
                    }
                }
            }
        }) { (error) in
        }
    }
    
    // MARK:
    // MARK: ViewWillLoad
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        print("loaded main VC")
        print("Next, grabbing prayer times in main VC")
        
        let prayerTimes = prayerTimesFunc.findingTheDateInTheArrayAndSIplayingIt()
        
        print("Nex, assigning them to UILabels")
        
        fajirAthan.text = prayerTimes[0]
        fajirIqama.text = prayerTimes[1]
        duhurAthan.text = prayerTimes[3]
        duhurIqamah.text = prayerTimes[4]
        asrAthan.text = prayerTimes[5]
        asrIqamah.text =  prayerTimes[6]
        maghribAthan.text = prayerTimes[7]
        maghribIqamah.text = prayerTimes[8]
        ishaAthan.text = prayerTimes[9]
        ishaIqamah.text = prayerTimes[10]
    }
    
    // MARK:
    // MARK: ViewDidLoad
    
    func postNotification() {
        present(obj, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector:#selector(postNotification()) , name: NSNotification.Name(rawValue: "test"), object: nil)
        
        readTokenFromFirebase()
        parstingTwitter()
        
        tabBar.title = ""
        tabBar.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        
        // MARK: iphone4
        
        if device == .iPhone4 || device == .iPhone4s || device == .simulator(.iPhone4) || device == .simulator(.iPhone4s) {
            
            //weatherStackView.spacing = CGFloat(0)
            embeddedView.isHidden = true
            qiblahConstraint.constant = CGFloat(2)
            constraintFromBotOfBorderToBottom.constant = 50
            constraintFromBotOfBorderToBottom.isActive = true
        }
        
        // MARK: iphone5
        
        if device == .iPhone5 || device == .iPhone5s || device == .iPhoneSE || device == .simulator(.iPhone5) || device == .simulator(.iPhone5s) || device == .simulator(.iPhoneSE) {
            // qiblahConstraint.constant = CGFloat(2)
            //fajirAthan.font = fajirAthan.font.withSize(CGFloat(20))
            fajirAthan.font = fajirAthan.font.withSize(CGFloat(13))
            fajirIqama.font = fajirIqama.font.withSize(CGFloat(13))
            duhurAthan.font = duhurAthan.font.withSize(CGFloat(13))
            duhurIqamah.font = duhurIqamah.font.withSize(CGFloat(13))
            asrAthan.font = asrAthan.font.withSize(CGFloat(13))
            asrIqamah.font =  asrIqamah.font.withSize(CGFloat(13))
            maghribAthan.font = maghribAthan.font.withSize(CGFloat(13))
            maghribIqamah.font = maghribIqamah.font.withSize(CGFloat(13))
            ishaAthan.font = ishaAthan.font.withSize(CGFloat(13))
            ishaIqamah.font = ishaIqamah.font.withSize(CGFloat(13))
        }
        
        // MARK: iphone6 & 7
        
        if device == .iPhone7 || device == .iPhone6 || device == .iPhone6s || device == .simulator(.iPhone6s) || device == .simulator(.iPhone6) || device == .simulator(.iPhone7) {
            
            weatherStackView.spacing = CGFloat(36)
            iqamahStackToRightBorder.constant = CGFloat(30)
            weatherStackToLeftBorder.constant = CGFloat(30)
            topOfMiddleTopBanner.constant = CGFloat(90)
            topOf1stJumuahToBotOfWeather.constant = CGFloat(20)
            JumuahToBlackLine.constant = CGFloat(5)
            qiblahConstraint.constant = CGFloat(12)
            paryerTimesTitleToWeatherStackTop.constant = CGFloat(40)
            iqamaToPrayerLabel.constant = CGFloat(4)
        }
        
        // MARK: iphone6 & 7 (plus)
        
        if device == .iPhone6Plus || device == .iPhone6sPlus || device == .iPhone7Plus  || device == .simulator(.iPhone6Plus) || device == .simulator(.iPhone6sPlus) || device == .simulator(.iPhone7Plus)  {
            
            topOfUwindsMSABanner.constant = CGFloat(0)
            weatherStackView.spacing = CGFloat(40)
            iqamahStackToRightBorder.constant = CGFloat(35)
            topOfUwindsMSABanner.constant = CGFloat(20)
            weatherStackToLeftBorder.constant = CGFloat(35)
            topOfMiddleTopBanner.constant = CGFloat(90)
            topOf1stJumuahToBotOfWeather.constant = CGFloat(40)
            JumuahToBlackLine.constant = CGFloat(20)
            qiblahConstraint.constant = CGFloat(12)
            paryerTimesTitleToWeatherStackTop.constant = CGFloat(40)
        }
        
        // MARK: ipad2,3,4,Air,Air2,Pro12inch
        
        if device == .iPad2 || device == .iPad3 || device == .iPad4 || device == .iPadAir || device == .iPadAir2 || device == .iPadPro9Inch || device == .iPadPro12Inch || device == .simulator(.iPadAir2) || device == .simulator(.iPadPro12Inch)  {
            
            qiblahConstraint.constant = CGFloat(2)
            
        }
    }
}
