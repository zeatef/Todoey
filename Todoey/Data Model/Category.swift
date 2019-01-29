//
//  Category.swift
//  Todoey
//
//  Created by Zeyad Atef on 1/29/19.
//  Copyright © 2019 ZeyadAtef. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
