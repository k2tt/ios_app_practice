//
//  TodoCollection.swift
//  Todo
//
//  Created by k2tt on 2016/02/07.
//  Copyright © 2016年 k2tt. All rights reserved.
//

import UIKit

class TodoCollection: NSObject {
    
    //TodoCollectionクラスのインスタンスをシングルトンな変数として再定義
    static let sharedInstance = TodoCollection()
    var todos:[Todo] = []

    func fetchTodos() {
        // Todoのインスタンス生成
        for (var i = 0; i < 7; i++) {
            let todo = Todo()
            // タイトルの設定
            todo.title = "Todo\(i + 1)"
            // 配列todosに追加
            self.todos.append(todo)
        }
    }

    func addTodoCollection(todo: Todo){
        self.todos.append(todo)
        self.save()
    }
    
    func save() {
        var todoList: Array<Dictionary<String, AnyObject>> = []
        for todo in todos {
            var todoDic = TodoCollection.convertDictionary(todo)
            todoList.append(todoDic)
        }
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(todoList, forKey: "todoList")
        defaults.synchronize()
    }
    
    class func convertDictionary(todo: Todo) -> Dictionary<String, AnyObject> {
        var dic = Dictionary<String, AnyObject>()
        dic["title"] = todo.title
        dic["descript"] = todo.descript
        dic["priority"] = todo.priority.rawValue
        return dic
    }
    
}
