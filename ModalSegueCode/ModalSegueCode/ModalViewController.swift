//
//  ModalViewController.swift
//  ModalSegueCode
//
//  Created by k2tt on 2016/01/09.
//  Copyright © 2016年 k2tt. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 1.0, green: 153.0 / 255, blue: 0.0, alpha: 1.0)
        let label = UILabel()
        label.text = "ModalViewController"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "HiraKakuProN-W6", size: 20)
        label.sizeToFit()
        label.center = self.view.center
        self.view.addSubview(label)
        
        let button = UIButton()
        button.setTitle("hide Modal", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.sizeToFit()
        button.center = CGPoint(x: self.view.center.x, y: label.frame.maxY + 60)
        button.addTarget(self, action: "didTouchButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didTouchButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
        })
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
