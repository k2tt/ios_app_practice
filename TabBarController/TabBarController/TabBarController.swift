//
//  TabBarController.swift
//  TabBarController
//
//  Created by k2tt on 2016/01/17.
//  Copyright © 2016年 k2tt. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //指定する色を定義
        let blue = UIColor(red: 11.0 / 255, green: 78.0 / 255, blue: 160.0 / 255, alpha: 1.0)
        
        //Tab Barの背景色を設定
        UITabBar.appearance().barTintColor = blue
        UITabBar.appearance().translucent  = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
