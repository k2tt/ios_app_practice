//
//  ViewController.swift
//  TextView
//
//  Created by k2tt on 2015/12/21.
//  Copyright © 2015年 k2tt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //テキスト
        myTextView.text = "ICモンゴメリ\nhttps://google.com/"
        
        //テキストカラー
        myTextView.textColor = UIColor.redColor()
        //背景色
        myTextView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 1.0, alpha: 1.0)
        
        //フォント
        myTextView.font = UIFont(name: "Helvetica", size: 15)
        
        myTextView.editable = false
        myTextView.dataDetectorTypes = UIDataDetectorTypes.Link
        myTextView.textContainerInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

