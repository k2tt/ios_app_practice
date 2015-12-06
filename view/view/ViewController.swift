//
//  ViewController.swift
//  view
//
//  Created by k2tt on 2015/12/06.
//  Copyright © 2015年 k2tt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        subView.backgroundColor = UIColor.orangeColor()
        label.backgroundColor = UIColor(red: 30.0/255, green: 144.0/255, blue: 255.0/255, alpha: 1.0)
        subView.alpha = 0.0
        label.alpha = 0.0
        
        self.view.backgroundColor = UIColor.grayColor()
//        print(self.view.subviews[0])
//        print(subView)
        print(self.view.subviews[0].subviews)
        
        let newViewFrame = CGRectMake(50, 100, 200, 100)
        let newView = UIView(frame: newViewFrame)
        newView.backgroundColor = UIColor.blueColor()
        self.view.addSubview(newView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

