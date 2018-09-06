//
//  SubMenuAttributes.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-24.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import Foundation

struct SubMenuAttributes {
    let name: String
    let link: String
    let parent: Int
    var children = [SubOfSubOfMenuAtrtributes]()
    
    init(name: String, link: String, parent: Int, theChildren: [SubOfSubOfMenuAtrtributes]){
        self.name = name
        self.link = link
        self.parent = parent
        self.children  = theChildren
    }
}
