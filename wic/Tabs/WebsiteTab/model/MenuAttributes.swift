//
//  MenuAttributes.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-23.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit

struct MenusAttibute {
    
    var id: Int
    var title: String
    var urlForTheMenu: String
    //var parentOfMenu: Int
    var description: String
    var children = [SubMenuAttributes]()
    
    init(id: Int, title: String, urlForTheMenu: String, description: String, children: [SubMenuAttributes]) {
        self.id = id
        self.title = title
        self.urlForTheMenu = urlForTheMenu
        self.description = description
        self.children.append(contentsOf: children)
    }
}

