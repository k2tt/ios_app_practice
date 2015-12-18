//
//  ViewController.swift
//  Album
//
//  Created by k2tt on 2015/12/16.
//  Copyright © 2015年 k2tt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        setBorderToImageView(imageView1)
        setBorderToImageView(imageView2)
        setBorderToImageView(imageView3)
        setBorderToImageView(imageView4)
        setBorderToImageView(imageView5)

    }
    
    func setBorderToImageView (imageView : UIImageView) {
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.whiteColor().CGColor
    }

    @IBAction func tapButton(sender: UIButton) {
        imageView1.image = UIImage(named: "\(arc4random() % 30 + 1).png")
        imageView2.image = UIImage(named: "\(arc4random() % 30 + 1).png")
        imageView3.image = UIImage(named: "\(arc4random() % 30 + 1).png")
        imageView4.image = UIImage(named: "\(arc4random() % 30 + 1).png")
        imageView5.image = UIImage(named: "\(arc4random() % 30 + 1).png")
        
    }

}

