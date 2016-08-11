//
//  AboutHeaderCell.swift
//  上路啦
//
//  Created by ChampOn on 16/7/15.
//  Copyright © 2016年 com.champon. All rights reserved.
//

import UIKit
//swift协议声明
@objc
protocol LoginDelegate {
    func LoginButtonClicked()//swift协议方法
}
class AboutHeaderCell: UITableViewCell {

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    weak var loginDelegate:LoginDelegate?//swift协议对象
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bgImageView.userInteractionEnabled = true
        self.button1.layer.masksToBounds = true
        self.button1.layer.cornerRadius = 5.0
        self.button1.layer.borderColor = UIColor.whiteColor().CGColor
        self.button1.layer.borderWidth = 1.0
        
        self.button2.layer.masksToBounds = true
        self.button2.layer.cornerRadius = 5.0
        self.button2.layer.borderColor = UIColor.whiteColor().CGColor
        self.button2.layer.borderWidth = 1.0
        
        self.button3.layer.masksToBounds = true
        self.button3.layer.cornerRadius = 5.0
        self.button3.layer.borderColor = UIColor.whiteColor().CGColor
        self.button3.layer.borderWidth = 1.0
        
        self.headerImageView.layer.masksToBounds = true
        self.headerImageView.layer.cornerRadius = self.headerImageView.frame.size.width/2
        
        // Initialization code
    }

    @IBAction func button1Clicked(sender: AnyObject) {
        PRINT("点击了收藏")
        if (loginDelegate != nil) {
            loginDelegate?.LoginButtonClicked()
        }
    }
    
    @IBAction func button2Clicked(sender: AnyObject) {
        PRINT("点击了锦囊")
        if (loginDelegate != nil) {
            loginDelegate?.LoginButtonClicked()
        }
    }
    
    @IBAction func button3Clicked(sender: AnyObject) {
        PRINT("点击了行程")
        if (loginDelegate != nil) {
            loginDelegate?.LoginButtonClicked()
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
