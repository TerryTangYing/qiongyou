//
//  AppDelegate.swift
//  上路啦
//
//  Created by ChampOn on 16/7/13.
//  Copyright © 2016年 com.champon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootTab = UITabBarController()
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        self.addChildController(RecommendViewController(), title: "推荐", image: UIImage.init(named: "tabbar_reduceprice_press")!, selectedImage: UIImage.init(named: "tabbar_reduceprice")!)
        self.addChildController(DestinationViewController(), title: "目的地", image: UIImage.init(named: "tabbar_subject_press")!, selectedImage: UIImage.init(named: "tabbar_subject")!)
        self.addChildController(CommunityViewController(), title: "社区", image: UIImage.init(named: "tabbar_appfree_press")!, selectedImage: UIImage.init(named: "tabbar_appfree")!)
        self.addChildController(AboutViewController(), title: "关于", image: UIImage.init(named: "tabbar_account_press")!, selectedImage: UIImage.init(named: "tabbar_account")!)
        /*
         swift 不会给变量赋初值，也即是说变量不会有默认值，所以要求在使用变量之前必须对其进行初始化。
         所以可以声明为Option（NONE,SOME），加？，也就是说，如果不显示的赋值就会有一个默认的nil
         另一种！的作用是：确定这个数据一定是非nil的，尽情的调用吧
        */
        
        window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        window?.makeKeyAndVisible()
        window?.rootViewController = rootTab
        
        
        
        
        
        
        return true
    }
    //私有方法，其他类无法调用
    private func addChildController(controller:UIViewController,title:String,image:UIImage,selectedImage:UIImage)
    {
        controller.tabBarItem.title = title
        controller.tabBarItem.image = image
        controller.tabBarItem.selectedImage = selectedImage
        let navi = UINavigationController()
        navi.addChildViewController(controller)
        rootTab.addChildViewController(navi)
        
        
    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

