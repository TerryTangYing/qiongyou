//
//  AboutViewController.swift
//  上路啦
//
//  Created by ChampOn on 16/7/14.
//  Copyright © 2016年 com.champon. All rights reserved.
//

import UIKit
let headerCellID = "headerCellID"
let cellID = "cellID"

class AboutViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,LoginDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var headerView: UIView!
    let arr1:Array = ["我的订单","我收藏的折扣","我的优惠券"]
    let arr2:Array = ["我收藏的目的地","我的足迹","点我点评的目的地"]
    let arr3:Array = ["我发布的帖子","我的问答","我的结伴","我的讨论组"]
    var dataSourceArr:Array<Array<String>> = []
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        dataSourceArr.append(arr1)
        dataSourceArr.append(arr2)
        dataSourceArr.append(arr3)
        
        // Do any additional setup after loading the view.
    }
    private func setUI() {
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.hidden = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerNib(UINib.init(nibName: "AboutHeaderCell", bundle: nil), forCellReuseIdentifier: headerCellID)
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        
        
    }
    
    //TableView协议方法
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        }else
        {
            return 40
        }
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else
        {
            return 20
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 3
        case 3:
            return 4
        default:
            return 0
        }
//        let arr = dataSourceArr[section]
//        return arr.count
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1+dataSourceArr.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(headerCellID) as!AboutHeaderCell //相当于强转
            cell.loginDelegate = self
            return cell
        }else
        {
            var cell = tableView.dequeueReusableCellWithIdentifier(cellID)
            if cell == nil {
                cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
                let arr = dataSourceArr[indexPath.section-1]
                cell?.textLabel?.font = UIFont.systemFontOfSize(12)
                cell?.textLabel?.text = arr[indexPath.row]
                
            }
            
            
            cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            return cell!
            
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    //tableView开始滑动的时候，缩放图片
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let point = scrollView.contentOffset
        if point.y > 0 {
            //向上滑动时
            self.headerView.backgroundColor = COLOR(0.3, g: 0.8, b: 0.9 ,a: 0.6)
        }else
        {
            self.headerView.backgroundColor = UIColor.clearColor()
        }
        
    }
    func LoginButtonClicked() {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
        self.tabBarController?.tabBar.hidden = true
    }
    func login() {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
