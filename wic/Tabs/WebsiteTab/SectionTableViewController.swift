//
//  uwindsorMSAWebsiteViewController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-19.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit
import SwiftyJSON

class SectionTableViewController: UITableViewController {
    
    //-----------------------------------
    //
    // MARK: - Variables & Constants
    //
    //-----------------------------------
    
    
    @IBOutlet var justAtableView: UITableView!
    let spinner = UIActivityIndicatorView()
    
    var parentTextLabel: String?
    var sectionsArray = [MenusAttibute]()
    var subSectionsArray = [SubMenuAttributes]()
    var anotherSubSectionArray = [SubOfSubOfMenuAtrtributes]()
    
    //-----------------------------------
    //
    //    MARK: - Functions
    //
    //-----------------------------------
    
    
    // MAke this function as Extenstion to a String
    func removeTheAmpersandCodeFromTheTitle(title: String) -> String {
        
        let newTitle = title.replacingOccurrences(of: "&#038;", with: "&")
        return newTitle
    }
    
//    func parseJSON(jsonData: Any){
//        
//        //
//        // 3 For-loops
//        //
//        
//        if let some = jsonData as? [String: AnyObject] {
//            
//            if let fbData = some["items"] as? [[String: AnyObject]] {
//                
//                
//                for menus in fbData {
//                    
//                    //
//                    // 1st For-Loop
//                    //
//                    
//                    
//                    if let upperTitle = menus["title"] as? String,
//                        let upperId = menus["id"] as? Int,
//                        let upperUrl = menus["url"] as? String,
//                        let upperDesc = menus["description"] as? String {
//                        
//                        // COMMENT: Get the children of TOP Menu
//                        
//                        let newUpperTitle = removeTheAmpersandCodeFromTheTitle(title: upperTitle)
//                        
//                        subSectionsArray = []
//                        if let children = menus["children"] as? [[String: AnyObject]] {
//                            
//                            
//                            for eachChildren in children {
//                                
//                                //
//                                // second For-loop
//                                //
//                                
//                                
//                                if let titleOfChild = eachChildren["title"] as? String,
//                                    let url = eachChildren["url"] as? String,
//                                    let parentOfMenu = eachChildren["parent"] as? Int
//                                {
//                                    
//                                    anotherSubSectionArray = []
//                                    
//                                    let newTitle = removeTheAmpersandCodeFromTheTitle(title: titleOfChild)
//                                    
//                                    if let childrenOfChildren = eachChildren["children"] as? [[String: AnyObject]] {
//                                        
//                                        for titleOfChildren in childrenOfChildren {
//                                            
//                                            //
//                                            // Third For-loop
//                                            //
//                                            
//                                            if let titleOfSubChildren = titleOfChildren["title"] as? String,
//                                                let url = titleOfChildren["url"] as? String,
//                                                let parentOfMenu = eachChildren["parent"] as? Int {
//                                                let newTitle = removeTheAmpersandCodeFromTheTitle(title: titleOfSubChildren)
//                                                
//                                                let oneRow = SubOfSubOfMenuAtrtributes(name: newTitle, link: url, parent: parentOfMenu)
//                                                anotherSubSectionArray.append(oneRow)
//                                            }
//                                            
//                                        } // third For-Loop
//                                        
//                                    } // if let childrenOfChildren = eachChildren["children"] as? [[String: AnyObject]]
//                                    
//                                    let oneMenu = SubMenuAttributes(name: newTitle, link: url, parent: parentOfMenu, theChildren: anotherSubSectionArray )
//                                    
//                                    subSectionsArray.append(oneMenu)
//                                    
//                                } //childrenOfChildren
//                                
//                            } //  2nd For-loop
//                            
//                        } //if let children = menus["children"] as? [[String: AnyObject]]
//                        
//                        sectionsArray.append(MenusAttibute(id: upperId, title: newUpperTitle, urlForTheMenu: upperUrl, description: upperDesc, children: subSectionsArray))
//                    }
//                    
//                } // 1st for-loop
//                
//            } // if let fbData = some["items"] as? [[String: AnyObject]]
//            
//        } //  if let some = jsonData as? [String: AnyObject]
//        
//    } //End of Func
    
    
    func parseJSON(jsonData: JSON){
    
        
    }
    
    
    func addSpinner(){
        
        spinner.center = justAtableView.center
        spinner.center.y = justAtableView.center.y - CGFloat(80)
        spinner.color = UIColor.blue
        justAtableView.addSubview(spinner)
        
        spinner.startAnimating()
    }
    
    func remmoveSpinner() {
        spinner.stopAnimating()
        spinner.removeFromSuperview()
    }
    
    //-----------------------------------
    //
    //     MARK: - viewWillLoad
    //
    //-----------------------------------
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    
        let aurl = NSURL(string: "http://uwindsormsa.com/wp-json/wp-api-menus/v2/menus/60")
        do {
            
            let queue = DispatchQueue(label: "cool")
            queue.async {
                self.addSpinner()
                if let data = try? Data(contentsOf: aurl! as URL, options: []) {
                   // let json = try? JSONSerialization.jsonObject(with: data, options: [])
                   let json = JSON(data: data)
                    self.parseJSON(jsonData: json)
                    
                    DispatchQueue.main.async {
                        
                        self.tableView.reloadData()
                        self.remmoveSpinner()
                    }
                }
            }
            
        } catch let error as NSError {
            print("Error: \(error)")
        }
        
        // Do any additional setup after loading the view.
    }

    //-----------------------------------
    //
    //     MARK:  ViewDidLoad
    //
    //-----------------------------------
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
////        let aurl = NSURL(string: "http://uwindsormsa.com/wp-json/wp-api-menus/v2/menus/60")
////        do {
////            
////            let queue = DispatchQueue(label: "cool")
////            queue.async {
////                self.addSpinner()
////                if let data = try? Data(contentsOf: aurl! as URL, options: []) {
////                    let ajson = try? JSONSerialization.jsonObject(with: data, options: [])
////                    self.parseJSON(jsonData: ajson)
////                    DispatchQueue.main.async {
////                        
////                        self.tableView.reloadData()
////                        self.remmoveSpinner()
////                    }
////                }
////            }
////            
////        } catch let error as NSError {
////            print("Error: \(error)")
////        }
//        
//        // Do any additional setup after loading the view.
//    }
//    
//    // MARK: ViewDidDisappear
//    override func viewDidDisappear(_ animated: Bool) {
//     //   sectionsArray = []
//    }
    //-----------------------------------
    //
    // MARK: - TableView Delegate Methods
    //
    //-----------------------------------
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let oneRow = sectionsArray[indexPath.row]
        cell.textLabel?.text = oneRow.title
        cell.detailTextLabel?.text = oneRow.description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        // This method will get triggered when selecting a row,
        // if row that has a title with no sub-pages, we call the perfromSegue() with an identifier
        
        // '1' = call the
        
        if sectionsArray[indexPath.row].children.count == 0 {
            performSegue(withIdentifier: "2", sender: indexPath)
        } else {
            performSegue(withIdentifier: "1", sender: indexPath)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "1" {
            // This means that a page has sub-pages.
            // so we push the current row details to the next tableView controller
            // to display the subpages
            
            if let path = sender as? IndexPath {
                
                if let dvc = segue.destination as? SubSectionTableViewController {
                    dvc.cellDetails = sectionsArray[path.row].children
                }
            }
        } else {
            // Just get the selected row's link and display the webapge in the webPageView
            if let path = sender as? IndexPath {
                if let dvc = segue.destination as? WebSiteViewController {
                    dvc.link = sectionsArray[path.row].urlForTheMenu
                }
            }
        }
    }
    
    //    func getThoseMenus(theParent: String){
    //        //  print(subSectionsArray[0].parentOfMenu)
    //
    //        for (_,value) in sectionsArray.enumerated() {
    //            if value.title == theParent {
    //                print("worked")
    //                for (_,stuff) in subSectionsArray.enumerated() {
    //                    //  if value.id == stuff.parentOfMenu {
    //                    //     print(stuff.title)
    //
    //                    // print(stuff[index].title)
    //                    //}
    //                }
    //            }
    //        }
    //    }
    
    // MARK:
    // MARK: ViewDidLoad
    
    //    let queue = DispatchQueue(label: "com.jakemarsh.image-processing")
    //    queue.async {
    //
    //    //let thumbnail = image.resize(to: thumbnailSize(for: image))
    //    self.uwindsorMSA(boolCheckMark: true)
    //
    //    self.CoolArray = [Event]()
    //    DispatchQueue.main.async {
    //    self.viewDidLoad()
    //
    //    }
    //    }
}
