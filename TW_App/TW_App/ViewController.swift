//
//  ViewController.swift
//  TW_App
//
//  Created by k2tt on 2016/01/02.
//  Copyright © 2016年 k2tt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerScrollView: UIScrollView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    let bgView = UIView()
    let textField = UITextField()
    let textView = UITextView()
    
    var tweetArray: Array<Dictionary<String, String>> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource  = self
        
        //セルの高さを自動で計算
        self.tableView.estimatedRowHeight = 93
        tableView.rowHeight = UITableViewAutomaticDimension
        
        headerScrollView.contentSize = CGSize(width: 2000, height: 190)
        
        setProfileImageView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // TableViewの処理 -----------------------------

    /**
     * セクション数
     */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetArray.count
    }

    /**
     * セルの Identifier をコードとひも付け
     */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell")!
        let tweet = tweetArray[indexPath.row]
        
        let nameLabel = cell.viewWithTag(1) as! UILabel
        nameLabel.text = tweet["name"]
        nameLabel.font = UIFont(name: "HirakakuProN-W6", size: 13)
        
        let textLabel = cell.viewWithTag(2) as! UILabel
        textLabel.text = tweet["text"]
        textLabel.font = UIFont(name: "HirakakuProN-W6", size: 18)
        textLabel.numberOfLines = 0
        
        let timeLabel = cell.viewWithTag(3) as! UILabel
        timeLabel.text = tweet["time"]
        timeLabel.font = UIFont(name: "HirakakuProN-W3", size: 10)
        timeLabel.textColor = UIColor.grayColor()
        
        let myImageView = cell.viewWithTag(4) as! UIImageView
        myImageView.image = UIImage(named: "pug")
        myImageView.layer.cornerRadius = 3
        myImageView.layer.masksToBounds = true
        
        return cell
    }
     
     
    // ボタンがタップされた時の処理 -----------------------------
     
    /**
     * tapTWButton
     */
    @IBAction func tapTWButton(sender: UIButton) {
        
        //半透明背景生成
        let bgView = makeBgView()
        self.view.addSubview(bgView)
        
        //投稿画面生成
        let twView = makeTWView()
        bgView.addSubview(twView)
        
        let textField = makeTextField()
        twView.addSubview(textField)
        
        let textView = makeTextView()
        twView.addSubview(textView)
        
        let nameLabel = makeLabel("名前", y: 18)
        twView.addSubview(nameLabel)
        
        let tweetLabel = makeLabel("ツイート内容", y: 98)
        twView.addSubview(tweetLabel)
        
        let cancelBtn = makeCancelBtn(twView)
        twView.addSubview(cancelBtn)
        
        let submitBtn = makeSubmitBtn()
        twView.addSubview(submitBtn)
        
    }
    
    /**
     * tappedCancelBtn
     */
    func tappedCancelBtn(sender: AnyObject){
        bgView.removeFromSuperview()
    }

    /**
     * tappedSubmitBtn
     */
    func tappedSubmitBtn(sender: AnyObject){
        
        if (textField.text!.isEmpty) || (textView.text.isEmpty){
            let alertController = UIAlertController(title: "Error", message: "'name' or 'text' is empty", preferredStyle: UIAlertControllerStyle.Alert)
            let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alertController.addAction(action)
            presentViewController(alertController, animated: true, completion: nil)
        }
        else {
            let name = textField.text!
            let tweet = textView.text
            //print("名前:\(name)、ツイート内容:\(tweet)")
            
            var tweetDic: Dictionary<String, String> = [:]
            tweetDic["name"] = name
            tweetDic["text"] = tweet
            tweetDic["time"] = getCurrentTime()
            //tweetArray.append(tweetDic) //appendでは最後に追加されてしまう
            tweetArray.insert(tweetDic, atIndex: 0)
        
            textField.text = ""
            textView.text = ""
            bgView.removeFromSuperview()
            tableView.reloadData()
        }
    }

    /**
     * 現在時刻を取得
     */
    func getCurrentTime() -> String {
        let now = NSDate() // 現在日時の取得
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .ShortStyle
        dateFormatter.dateStyle = .ShortStyle
        let currentTime = dateFormatter.stringFromDate(now)
        return currentTime
    }
    
    
    // 部品生成処理 -----------------------------
    
    /**
     * 半透明背景生成
     */
    func makeBgView() -> UIView {
        //サイズをViewControllerのサイズに設定
        bgView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        
        //背景色を黒に、透明度を0.6に設定
        bgView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6)
        
        return bgView
    }

    /**
     * 投稿画面生成
     */
    func makeTWView() -> UIView {
        //UIViewクラスのインスタンスを生成
        let twView = UIView()
        
        twView.frame.size = CGSizeMake(300, 300)
        twView.center.x = self.view.center.x
        twView.center.y = 250
        
        twView.layer.shadowOpacity = 0.3
        twView.layer.cornerRadius = 3
        
        //背景色を白に
        twView.backgroundColor = UIColor.whiteColor()

        return twView
    }
    
    
    /**
     * テキストフィールド生成
     */
    func makeTextField() -> UITextField {
        textField.frame = CGRectMake(10, 40, 280, 40)
        textField.font = UIFont(name: "HiraKakuProN-W6", size: 15)
        textField.borderStyle = UITextBorderStyle.RoundedRect
        return textField
    }
    
    /**
     * テキストビュー生成
     */
    func makeTextView() -> UITextView {
        textView.frame = CGRectMake(10, 120, 280, 110)
        textView.font = UIFont(name: "HiraKakuProN-W6", size: 15)
        textView.layer.cornerRadius = 8
        textView.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).CGColor
        textView.layer.borderWidth = 1
        return textView
    }
    
    /**
     * ラベル生成
     */
    func makeLabel(text: String, y: CGFloat) -> UILabel {
        let label = UILabel(frame: CGRectMake(10, y, 0, 0))
        label.text = text
        label.font = UIFont(name: "HiraKakuProN-W6", size: 15)
        label.sizeToFit()
        return label
    }
    
    /**
     * ボタン生成
     */
    func makeCancelBtn(twView: UIView) -> UIButton {
        let cancelBtn = UIButton()
        cancelBtn.frame.size = CGSizeMake(20, 20)
        cancelBtn.center.x = twView.frame.width-15
        cancelBtn.center.y = 15
        cancelBtn.setBackgroundImage(UIImage(named: "cancel.png"), forState: .Normal)
        cancelBtn.backgroundColor = UIColor(red: 0.14, green: 0.3, blue: 0.68, alpha: 1.0)
        cancelBtn.layer.cornerRadius = cancelBtn.frame.width/2
        cancelBtn.addTarget(self, action: "tappedCancelBtn:", forControlEvents: .TouchUpInside)
        return cancelBtn
    }
    
    func makeSubmitBtn() -> UIButton {
        let submitBtn = UIButton()
        submitBtn.frame = CGRectMake(10, 250, 280, 40)
        submitBtn.setTitle("送信", forState: .Normal)
        submitBtn.titleLabel?.font = UIFont(name: "HiraKakuProN-W6", size: 15)
        submitBtn.backgroundColor = UIColor(red: 0.14, green: 0.3, blue: 0.68, alpha: 1.0)
        submitBtn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        submitBtn.layer.cornerRadius = 7
        submitBtn.addTarget(self, action: "tappedSubmitBtn:", forControlEvents: .TouchUpInside)
        return submitBtn
    }

    /**
     * プロフィール画像装飾
     */
    func setProfileImageView() {
        profileImageView.layer.cornerRadius = 5
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.borderColor = UIColor.whiteColor().CGColor
    }
}

