//
//  ViewController.swift
//  Label
//
//  Created by k2tt on 2015/12/13.
//  Copyright © 2015年 k2tt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let color = UIColor(red: 30/255, green: 50/255, blue: 255/255, alpha: 0.6)
//        let font = UIFont.systemFontOfSize(20)
        myLabel.font = UIFont.boldSystemFontOfSize(15)
//        myLabel.font = UIFont(name: "Zapfino", size: 25)
        myLabel.text = "Swift\nis\nso fun!"
        myLabel.textColor = color
        myLabel.textAlignment = NSTextAlignment.Left
        myLabel.numberOfLines = 2
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

