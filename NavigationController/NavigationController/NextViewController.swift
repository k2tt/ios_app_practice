//
//  NextViewController.swift
//  NavigationController
//
//  Created by k2tt on 2016/01/12.
//  Copyright © 2016年 k2tt. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let deepRed = UIColor(red: 180.0 / 255, green: 84.0 / 255, blue: 112.0 / 255, alpha: 1.0)
        self.navigationController!.navigationBar.barTintColor = deepRed
        self.title = "Next View Controller"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
