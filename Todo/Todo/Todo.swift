//
//  Todo.swift
//  Todo
//
//  Created by k2tt on 2016/02/04.
//  Copyright © 2016年 k2tt. All rights reserved.
//

import UIKit

enum TodoPriority:Int {
    case Low = 0
    case Middle = 1
    case High = 2
}

class Todo: NSObject {
    var title = ""
    var descript = ""
    var priority:TodoPriority = .Low
}
