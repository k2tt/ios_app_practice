//
//  ViewController.swift
//  TextField
//
//  Created by k2tt on 2015/12/19.
//  Copyright © 2015年 k2tt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myTextField.delegate = self
//        myTextField.text = "Hello World"
        myTextField.textColor = UIColor(red: 100/255, green: 1/255, blue: 20/255, alpha: 1.0)
        myTextField.font = UIFont(name: "Helvetica-Bold",size: 30)
//        myTextField.font = UIFont.boldSystemFontOfSize(30)
        myTextField.textAlignment = NSTextAlignment.Center
        myTextField.placeholder = "キーワードで検索"
        myTextField.clearButtonMode = UITextFieldViewMode.WhileEditing
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        myTextField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

