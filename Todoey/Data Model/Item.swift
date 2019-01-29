//
//  Item.swift
//  Todoey
//
//  Created by Zeyad Atef on 1/29/19.
//  Copyright © 2019 ZeyadAtef. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
