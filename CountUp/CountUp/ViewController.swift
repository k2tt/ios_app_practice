//
//  ViewController.swift
//  CountUp
//
//  Created by k2tt on 2015/12/14.
//  Copyright © 2015年 k2tt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!

    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        numberLabel.layer.cornerRadius = numberLabel.frame.width / 2
        numberLabel.layer.masksToBounds = true
        moldingToCircleButton(plusButton)
        moldingToCircleButton(clearButton)
        moldingToCircleButton(minusButton)
    }
    
    func moldingToCircleButton(button: UIButton) {
        button.layer.cornerRadius = button.frame.width / 2
        button.layer.masksToBounds = true
    }

    @IBAction func tapPlusButton(sender: UIButton) {
        number++
        numberLabel.text = String(number)
    }
    
    @IBAction func tapClearButton(sender: UIButton) {
        number = 0
        numberLabel.text = String(0)
    }
    
    @IBAction func tapMinusButton(sender: UIButton) {
        number--
        numberLabel.text = String(number)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

