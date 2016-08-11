//
//  CountryNameView.swift
//  上路啦
//
//  Created by ChampOn on 16/7/22.
//  Copyright © 2016年 com.champon. All rights reserved.
//

import UIKit

class CountryNameView: UIView {

    let countryName = String()
    let iconImageView = UIImageView.init(image: UIImage.init(named: "smallRing"))
    let button = UIButton.init(type: UIButtonType.Custom)
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        self.backgroundColor = UIColor.clearColor()
        button.setBackgroundImage(UIImage.init(named: "button_back"), forState: UIControlState.Normal)
        button.addTarget(self, action: #selector(countryButtonClicked), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(button)
        self.addSubview(iconImageView)
    }
//    override func layoutSubviews() {
//        button.frame = CGRectMake(<#T##x: CGFloat##CGFloat#>, <#T##y: CGFloat##CGFloat#>, <#T##width: CGFloat##CGFloat#>, <#T##height: CGFloat##CGFloat#>)
//    }
    func countryButtonClicked()  {
        
    }
}
