//
//  ViewController.swift
//  WkWebView
//
//  Created by k2tt on 2015/12/31.
//  Copyright © 2015年 k2tt. All rights reserved.
//

import UIKit

//WebKitのインポート
import WebKit

//Socialフレームワークをインポート
import Social

class ViewController: UIViewController, WKNavigationDelegate {
    
    //WkWebViewクラスのインスタンスを生成
    let myWkWebView = WKWebView()
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myWkWebView.frame = CGRectMake(0, 64, self.view.frame.width, self.view.frame.height - 64 - 44)
        
        view.addSubview(myWkWebView)
        
        let myURL = NSURL(string: "http://yahoo.co.jp/")
        let myURLRequest = NSURLRequest(URL: myURL!)
        myWkWebView.loadRequest(myURLRequest)
        
        myWkWebView.navigationDelegate = self
        
        //Webページのタイトルを監視
        myWkWebView.addObserver(self, forKeyPath: "title", options: .New, context: nil)
        
    }
    
    //監視しているプロパティが変更された時に呼び出される
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        titleLabel.text = myWkWebView.title
    }
    
    //監視の解除
    deinit {
        myWkWebView.removeObserver(self, forKeyPath: "title")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapBackBtn(sender: UIButton) {
        myWkWebView.goBack()
    }
    
    @IBAction func tapNextBtn(sender: UIButton) {
        myWkWebView.goForward()
    }
    
    @IBAction func tapReloadBtn(sender: UIButton) {
        myWkWebView.reload()
    }

    @IBAction func tapStopBtn(sender: UIButton) {
        myWkWebView.stopLoading()
    }
    
    @IBAction func openActionSheet(sender: UIButton) {
        //アクションシートの生成
        let alertController = UIAlertController(title: "アクションシート",
            message: "これはアクションシートです。", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        //アクションを追加
        let safariAction = UIAlertAction(
            title: "safariで開く",
            style: UIAlertActionStyle.Default,
            handler:{(action: UIAlertAction!) -> Void in
                //3. openSafari()をアクションシートのアクションにクロージャとして呼び出す。
                self.openSafari()
            }
        )
        
        //Cancelボタン
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: UIAlertActionStyle.Cancel,
            handler: nil
        )
        
        //赤文字ボタン
//        let deleteAction = UIAlertAction(
//            title: "close",
//            style: UIAlertActionStyle.Destructive,
//            handler: nil
//        )
        
        //Facebookボタン
        let facebookAction = UIAlertAction(
            title: "Facebook",
            style: .Default,
            handler: {
                (action: UIAlertAction!) -> Void in
                self.facebookShare()
            }
        )

        //Twitterボタン
        let twitterAction = UIAlertAction(
            title: "Twitter",
            style: .Default,
            handler: {
                (action: UIAlertAction!) -> Void in
                self.twitterShare()
            }
        )

        
        //アクションシートにアクションの追加
        alertController.addAction(safariAction)
        alertController.addAction(cancelAction)
//        alertController.addAction(deleteAction)
        alertController.addAction(facebookAction)
        alertController.addAction(twitterAction)
        
        //アクションシートの表示
        self.presentViewController(alertController, animated: true, completion: nil)
        
        //アラートの生成
        //let alertController2 = UIAlertController(title: "アラート", message: "これはアラートです。", preferredStyle: UIAlertControllerStyle.Alert)
        
        //練習
        //let alertController3 = UIAlertController(title: "３", message: "大丈夫", preferredStyle: UIAlertControllerStyle.ActionSheet)
    }
    
    //1. openSafari()というメソッドを定義
    func openSafari(){
        //2. 定義したopenSafari()内にopenURL()メソッドを使ったSafariで開く処理を記述。
        UIApplication.sharedApplication().openURL(myWkWebView.URL!)
    }
    
    func facebookShare() {
        //Facebook用の投稿画面の作成
        let facebookVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        facebookVC.addURL(myWkWebView.URL)
        facebookVC.setInitialText("#demo")
        self.presentViewController(facebookVC, animated: true, completion: nil)
    }
    
    func twitterShare() {
        //Twitter用の投稿画面の作成
        let twitterVC = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        let url = NSURL(string: "http://google.com/")
        twitterVC.addURL(url)
        twitterVC.setInitialText("#test")
        self.presentViewController(twitterVC, animated: true, completion: nil)
        
    }
    
    //Webページの読み込みが開始したタイミングで、インジケータを表示
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    //Webページの読み込みが完了したタイミングで、インジケータを非表示
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }

    
}

