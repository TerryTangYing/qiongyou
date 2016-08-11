//
//  LoginViewController.swift
//  上路啦
//
//  Created by ChampOn on 16/7/15.
//  Copyright © 2016年 com.champon. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var registerBtn: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passWordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        
        // Do any additional setup after loading the view.
    }
    
    private func setUI()  {
        self.navigationController?.navigationBar.barTintColor = COLOR(0.41, g: 0.89, b: 0.75, a: 1)
        registerBtn.layer.masksToBounds = true;
        registerBtn.layer.cornerRadius = 3.0
        registerBtn.layer.borderColor = UIColor.whiteColor().CGColor
        registerBtn.layer.borderWidth = 1.0
        
        
        
    }
    
    @IBAction func backBtnClicked(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func registerBtnClicked(sender: AnyObject) {
        PRINT("点击了注册")
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
