//
//  ViewController.swift
//  UIButton
//
//  Created by k2tt on 2015/12/14.
//  Copyright © 2015年 k2tt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myButton = UIButton()
        myButton.frame.size = CGSizeMake(100, 50)
        myButton.center = self.view.center
        myButton.setTitle("Tap!", forState: UIControlState.Normal)
        myButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        myButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        myButton.addTarget(self, action: "tapButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton)
    }
    
    func tapButton(sender: UIButton) {
        print("ボタンがタップされました！")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

