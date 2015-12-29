//
//  ViewController.swift
//  text_app
//
//  Created by k2tt on 2015/12/26.
//  Copyright © 2015年 k2tt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var commentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        commentTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapSubmitButton(sender: UIButton) {
        commentTextField.resignFirstResponder()
        
        let label = makeCommentLabel()

        //ビューに追加
        self.view.addSubview(label)
        
        //0.1秒毎に moveComment を実行
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "moveComment:", userInfo: label, repeats: true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        commentTextField.resignFirstResponder()
        return true
    }
    
    /**
     * コメントラベル作成
     * return {UILabel} 作成したラベル
     */
    func makeCommentLabel() -> UILabel {
        let label = UILabel()
        
        //ビュー全体から、ヘッダーを抜いたY位置をランダムで取得
        let randY = CGFloat(arc4random()) % (self.view.frame.height - 64) + 64
        
        //20〜40をランダムで生成
        let fontSize = CGFloat(arc4random() % 21) + 20;
        
        label.text = commentTextField.text
        label.frame.origin = CGPoint(x: self.view.frame.width, y: randY)
        label.font = UIFont(name: "HirakakuProN-W6", size:fontSize)
        
        //ラベルの大きさを文字の大きさにフィットさせる
        label.sizeToFit()
        return label
    }
    
    func moveComment(sender: NSTimer) {
        let commentLabel = sender.userInfo as! UILabel
        commentLabel.frame.origin.x -= commentLabel.frame.height
    }

}

