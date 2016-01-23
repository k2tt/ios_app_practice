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
        let black = UIColor(red: 48.0 / 255, green: 48.0 / 255, blue: 47.0 / 255, alpha: 1.0)
        let white = UIColor.whiteColor()
        
        //Tab Bar Itemに設定する画像を用意
        let cameraImage            = makeOriginalImage("camera")
        let highlightedCameraImage = makeOriginalImage("highlighted_camera")
        let carImage               = makeOriginalImage("car")
        let highlightedCarImage    = makeOriginalImage("highlighted_car")

        
        //Tab Barの背景色を設定
        UITabBar.appearance().barTintColor = blue
        UITabBar.appearance().translucent  = false
        
        //TabBarControllerと紐付いているView Controllerを取得
        let firstViewController  = self.viewControllers![0]
        let secondViewController = self.viewControllers![1]
        
        //それぞれのView ControllerのTab Bar Itemに用意した画像を設定
        firstViewController.tabBarItem = UITabBarItem(title: "camera", image: cameraImage, selectedImage: highlightedCameraImage)
        secondViewController.tabBarItem = UITabBarItem(title: "car", image: carImage, selectedImage: highlightedCarImage)
        
        //特定のキーを指定した辞書型を用意
        let normalAttributes: Dictionary! = [NSForegroundColorAttributeName: black]
        let selectedAttributes: Dictionary! = [NSForegroundColorAttributeName: white]
        
        //Tab Bar Itemのタイトルカラーを設定
        UITabBarItem.appearance().setTitleTextAttributes(normalAttributes, forState: UIControlState.Normal)
        UITabBarItem.appearance().setTitleTextAttributes(selectedAttributes, forState: UIControlState.Selected)
        
        
    }
    
    func makeOriginalImage(name: String) -> UIImage {
        let image = UIImage(named: name)!
        let originalImage = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        return originalImage
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
