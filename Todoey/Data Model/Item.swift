//
//  Item.swift
//  Todoey
//
//  Created by Zeyad Atef on 1/27/19.
//  Copyright © 2019 ZeyadAtef. All rights reserved.
//

import Foundation

class Item {
    
    var title : String
    var done : Bool = false
    
    init(itemTitle : String, doneStatus : Bool) {
        title = itemTitle
        done = doneStatus
    }
    
    convenience init(itemTitle : String) {
        self.init(itemTitle: itemTitle, doneStatus: false)
    }
    
    
    
}
