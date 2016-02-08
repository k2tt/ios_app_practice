//
//  TodoCollection.swift
//  Todo
//
//  Created by k2tt on 2016/02/07.
//  Copyright © 2016年 k2tt. All rights reserved.
//

import UIKit

class TodoCollection: NSObject {
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
}
