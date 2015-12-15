//
//  ViewController.swift
//  UIImage
//
//  Created by k2tt on 2015/12/15.
//  Copyright © 2015年 k2tt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //画像を設定
        myImageView.image = UIImage(named: "animals.png")
        
        //表示モードの設定
        myImageView.contentMode = UIViewContentMode.ScaleAspectFill
        
        //表示領域で画像が切り抜かれる
        myImageView.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

