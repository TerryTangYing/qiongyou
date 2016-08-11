//
//  GuideViewController.swift
//  上路啦
//
//  Created by ChampOn on 16/7/14.
//  Copyright © 2016年 com.champon. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageArr:Array = ["guide01.jpg","guide02.jpg","guide03.jpg","guide04.jpg","guide05.jpg"]
        let scrollview = UIScrollView.init(frame: SCREEN)
        self.view.addSubview(scrollview)
        scrollview.contentSize = CGSizeMake(WIDTH*CGFloat(imageArr.count)+50, HEIGHT)
        scrollview.bounces = false
        scrollview.pagingEnabled = true
        for i in 0...imageArr.count-1 {
            let imageView = UIImageView.init(frame: CGRectMake(WIDTH*CGFloat(i), 0, WIDTH, HEIGHT))
            scrollview.addSubview(imageView)
            imageView.image = UIImage.init(named: imageArr[i])
            if i == imageArr.count-1 {
                let tap = UITapGestureRecognizer.init(target: self, action:#selector(goHome))
                imageView.userInteractionEnabled = true
                imageView.addGestureRecognizer(tap)
                
            }
        }
        
        
        
        

        // Do any additional setup after loading the view.
    }

    @objc private func goHome() {
        
        print(".....")
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
