//
//  ViewController.swift
//  photo_app
//
//  Created by k2tt on 2015/12/31.
//  Copyright © 2015年 k2tt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myScrollView: UIScrollView!

    let coverView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ScrollViewのコンテンツサイズを設定
        myScrollView.contentSize = CGSizeMake(730, 150)
        
        //8つのButton、UIView、Labelをセット
        setEffectGroup(CGFloat(10), action: "tappedOriginalBtn:", color: UIColor.clearColor(), text: "Original")
        setEffectGroup(CGFloat(100), action: "tappedRedBtn:", color: UIColor.redColor(), text: "Red")
        setEffectGroup(CGFloat(190), action: "tappedGreenBtn:", color: UIColor.greenColor(), text: "Green")
        setEffectGroup(CGFloat(280), action: "tappedBlueBtn:", color: UIColor.blueColor(), text: "Blue")
        setEffectGroup(CGFloat(370), action: "tappedYellowBtn:", color: UIColor.yellowColor(), text: "Yellow")
        setEffectGroup(CGFloat(460), action: "tappedPurpleBtn:", color: UIColor.purpleColor(), text: "Purple")
        setEffectGroup(CGFloat(550), action: "tappedCyanBtn:", color: UIColor.cyanColor(), text: "Cyan")
        setEffectGroup(CGFloat(640), action: "tappedWhiteBtn:", color: UIColor.whiteColor(), text: "White")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //coverViewの配置する座標とサイズを設定
        coverView.frame = CGRectMake(0, 0, myImageView.frame.width, myImageView.frame.height)
        
        //coverViewの透明度を0.1に設定
        coverView.alpha = 0.1
        
        //myImageView上にcoverViewを配置
        myImageView.addSubview(coverView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //エフェクトのグループをセットする関数
    func setEffectGroup(x: CGFloat, action: Selector, color: UIColor, text: String){
        let originalBtn = makeButton(x, action: action)
        myScrollView.addSubview(originalBtn)
        let originalBtnCoverView = makeButtonCoverView(color)
        originalBtn.addSubview(originalBtnCoverView)
        let originalLabel = makeEffectLabel(x, text: text)
        myScrollView.addSubview(originalLabel)
    }
    
    func tappedOriginalBtn(sender: UIButton) {
        print("oh my god")
        coverView.backgroundColor = UIColor.clearColor()
    }
    
    func tappedRedBtn(sender: UIButton){
        print("RedButtonがタップされた。")
        //coverViewの背景色を赤に設定
        coverView.backgroundColor = UIColor.redColor()
    }
    
    func tappedGreenBtn(sender: UIButton){
        print("GreenButtonがタップされた。")
        coverView.backgroundColor = UIColor.greenColor()
    }
    
    func tappedBlueBtn(sender: UIButton){
        print("BlueButtonがタップされた。")
        coverView.backgroundColor = UIColor.blueColor()
    }
    
    func tappedYellowBtn(sender: UIButton){
        print("YellowButtonがタップされた。")
        coverView.backgroundColor = UIColor.yellowColor()
    }
    
    func tappedPurpleBtn(sender: UIButton){
        print("PurpleButtonがタップされた。")
        coverView.backgroundColor = UIColor.purpleColor()
    }
    
    func tappedCyanBtn(sender: UIButton){
        print("CyanButtonがタップされた。")
        coverView.backgroundColor = UIColor.cyanColor()
    }
    
    func tappedWhiteBtn(sender: UIButton){
        print("WhiteButtonがタップされた。")
        coverView.backgroundColor = UIColor.whiteColor()
    }
    
    //ボタンを生成する関数
    func makeButton(x: CGFloat, action: Selector) -> UIButton {
        let button = UIButton()
        button.frame = CGRectMake(x, 30, 80, 80)
        button.addTarget(self, action: action, forControlEvents:.TouchUpInside)
        button.setBackgroundImage(UIImage(named: "cat.png"), forState: UIControlState.Normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 3.0
        return button
    }
    
    //ボタンにかぶせるUIViewを生成
    func makeButtonCoverView(color: UIColor) -> UIView {
        let buttonCoverView = UIView()
        buttonCoverView.frame = CGRectMake(0, 0, 80, 80)
        buttonCoverView.backgroundColor = color
        buttonCoverView.alpha = 0.1
        buttonCoverView.userInteractionEnabled = false
        return buttonCoverView
    }
    
    //ラベルの生成する関数
    func makeEffectLabel(x: CGFloat, text: String) -> UILabel {
        let effectLabel = UILabel()
        effectLabel.frame =  CGRectMake(x, 110, 80, 20)
        effectLabel.text = text
        effectLabel.font = UIFont(name: "Helvetica-Light",size: CGFloat(15))
        effectLabel.textAlignment = NSTextAlignment.Center
        effectLabel.textColor = UIColor.whiteColor()
        return effectLabel
    }

}

