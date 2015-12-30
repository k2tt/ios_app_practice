//
//  ViewController.swift
//  ScrollView
//
//  Created by k2tt on 2015/12/29.
//  Copyright © 2015年 k2tt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myScrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myScrollView.contentSize = CGSizeMake(1000, 1000)
        
        //UIImageViewクラスのインスンタンスを生成
        let myImageView = UIImageView()
        
        //myImageViewに画像を設定
        myImageView.image = UIImage(named: "pug.png")
        
        myImageView.frame = CGRectMake(0, 0, 1000, 1000)
        
        //myImageViewをmyScrollViewのビューに配置
        myScrollView.addSubview(myImageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

