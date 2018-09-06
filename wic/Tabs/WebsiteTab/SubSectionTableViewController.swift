//
//  SubSectionTableViewController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-20.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit

class SubSectionTableViewController: UITableViewController {
    
    var titleOf: String?
    var utl: String?
    var cellDetails = [SubMenuAttributes]()
    
    @IBOutlet weak var titleOfMenu: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cellDetails.count
    }
    
    ///*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        print("Cell is")
        print(cellDetails[indexPath.row])
        
        let name = cellDetails[indexPath.row].name
        cell.textLabel?.text = name
        
        return cell
    }
    
    ///*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "2" {
            if let path = sender as? IndexPath{
                if let dvc = segue.destination as? SubOfSubTableViewController{
                    dvc.arrayOfCells = cellDetails[path.row].children
                }
            }
        } else {
            if let path = sender as? IndexPath {
                if let dvc = segue.destination as? WebSiteViewController {
                    dvc.link = cellDetails[path.row].link
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if cellDetails[indexPath.row].children.count == 0 {
            performSegue(withIdentifier: "1", sender: indexPath)
        } else {
            performSegue(withIdentifier: "2", sender: indexPath)
        }
    }
}
