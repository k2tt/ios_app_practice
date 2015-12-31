//
//  ViewController.swift
//  UIWebView
//
//  Created by k2tt on 2015/12/31.
//  Copyright © 2015年 k2tt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var myWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //1. WebページのURL(文字列)からNSURLクラスのインスタンスを生成
        let myURL = NSURL(string: "http://yahoo.co.jp/")
        
        //2. myURLからNSURLRequestクラスのインスタンスを生成
        let myURLRequest = NSURLRequest(URL: myURL!)
        
        //3. myWebViewに指定したWebページを表示
        myWebView.loadRequest(myURLRequest)
        
        //1.デリゲート先をViewController(self)に指定。
        myWebView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //2.Webページの読み込みが開始されるタイミングで呼ばれるデリゲートメソッド
    func webViewDidStartLoad(webView: UIWebView) {
        
        //3.インジケータを表示
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    //2.Webページの読み込みが終了したタイミングで呼ばれるデリゲートメソッド
    func webViewDidFinishLoad(webView: UIWebView) {
        
        //3.インジケータを非表示
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }

    @IBAction func goBack(sender: UIButton) {
        myWebView.goBack()
    }
    
    @IBAction func goForward(sender: UIButton) {
        myWebView.goForward()
    }
    
    @IBAction func reloadBtn(sender: UIButton) {
        myWebView.reload()
    }
    
    @IBAction func stopBtn(sender: UIButton) {
        myWebView.stopLoading()
    }
    
}

