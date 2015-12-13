//
//  ViewController.swift
//  Button
//
//  Created by k2tt on 2015/12/13.
//  Copyright © 2015年 k2tt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myButton_2: UIButton!
    @IBOutlet weak var myButton_3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myButton.setTitle("Like!", forState: UIControlState.Normal)
        
        myButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Highlighted)
        
        myButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 30)
        
        myButton_2.setImage(UIImage(named: "home.png"), forState: UIControlState.Normal)
        
        myButton_3.setBackgroundImage(UIImage(named: "twitter.png"), forState: UIControlState.Normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

