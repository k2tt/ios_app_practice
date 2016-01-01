//
//  ViewController.swift
//  UITableView
//
//  Created by k2tt on 2016/01/01.
//  Copyright © 2016年 k2tt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!

    //1.画像の名前を入れた配列を定義
    let dogImageArray = ["Pug", "Chihuahua","Miniature Dachshund", "Maltese"]
    let catImageArray = ["American Shorthair", "Munchkin", "Persian", "Russian Blue", "Mikeneko"]
    let sectionTitle = ["Dog", "Cat"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myTableView.delegate = self
        myTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //行数の行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowNumber: Int
        if section == 0 {
            rowNumber = dogImageArray.count  //4 (dogImageArray配列の要素数)
        } else {
            rowNumber = catImageArray.count  //5 (catImageArray配列の要素数)
        }
        return rowNumber
    }
    
    //セクションの数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    //cellの内容
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "myCell")
        cell.textLabel?.text = sectionTitle[indexPath.section]
        //cell.detailTextLabel?.text = "Row: \(indexPath.row)"
        //cell.imageView?.image = UIImage(named: "\(dogImageArray[indexPath.row]).png")
        if indexPath.section == 0 {
            cell.detailTextLabel?.text = "This dog is a \(dogImageArray[indexPath.row])"
            cell.imageView?.image = UIImage(named: "\(dogImageArray[indexPath.row]).png")
        } else {
            cell.detailTextLabel?.text = "This cat is a \(catImageArray[indexPath.row])"
            cell.imageView?.image = UIImage(named: "\(catImageArray[indexPath.row]).png")
        }
        return cell
    }

    //cellの高さ設定
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(60)
    }
    
    //セクションのタイトル
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    //セクションの高さ
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(44)
    }

}

