//
//  ViewController.swift
//  NavigationController
//
//  Created by k2tt on 2016/01/11.
//  Copyright © 2016年 k2tt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let deepGreen = UIColor(red: 72.0 / 255, green: 140.0 / 255, blue: 141.0 / 255, alpha: 1.0)
        self.navigationController!.navigationBar.barTintColor = deepGreen
        self.title = "Main View Controller"
        self.navigationController!.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.whiteColor(),
                NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 20)!]
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.translucent = false
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.Plain, target: self, action: "toNextViewController")
    }

    @IBAction func tapTransitionBtn(sender: UIButton) {
        self.performSegueWithIdentifier("NextSegue", sender: nil)
    }
    
    func toNextViewController() {
        self.performSegueWithIdentifier("NextSegue", sender: nil)
    }

}

