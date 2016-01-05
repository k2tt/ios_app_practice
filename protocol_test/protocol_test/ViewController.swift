//
//  ViewController.swift
//  protocol_test
//
//  Created by k2tt on 2016/01/05.
//  Copyright © 2016年 k2tt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ModalViewDelegate {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func myButton(sender: UIButton) {
        showModal()
    }
    
    //ModalViewを表示する
    func showModal() {
        let modalView = ModalView(frame: self.view.bounds)
        modalView.customDelegate = self
        self.view.addSubview(modalView)
    }
    
    func modalView(text: String) {
        label.text = text
    }

}

