//
//  Prefix.swift
//  上路啦
//
//  Created by ChampOn on 16/7/14.
//  Copyright © 2016年 com.champon. All rights reserved.
//

import Foundation
import UIKit


//接口
//推荐
let RECOMMONDPATH = "http://open.qyer.com/qyer/recommands/trip?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=10&lat=40.03623104039519&lon=116.3638251674019&page=1&track_app_channel=App%2520Store&track_app_version=6.8&track_device_info=iPhone7%2C1&track_deviceid=7B6FA080-F9FB-44C1-B932-401CD69CD5D2&track_os=ios%25209.1&type=index&v=1"
//目的地
let DESTINATIONPATH = "http://open.qyer.com/qyer/footprint/continent_list?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&lat=40.03623447101837&lon=116.363814398621&page=1&track_app_channel=App%2520Store&track_app_version=6.8&track_device_info=iPhone7%2C1&track_deviceid=7B6FA080-F9FB-44C1-B932-401CD69CD5D2&track_os=ios%25209.1&v=1"


let SCREEN = UIScreen.mainScreen().bounds
let WIDTH = UIScreen.mainScreen().bounds.size.width
let HEIGHT = UIScreen.mainScreen().bounds.size.height
let USERDEFAULT = NSUserDefaults.standardUserDefaults()
let TABRHEIGHT = 49.0
let NAVIHEIGHT = 44.0



//function
//打印
var ISDEBUG = true
public func PRINT (item:Any)
{
    if ISDEBUG {
        print(item)
    }else
    {
        //release状态下不做事情
    }
}

public func COLOR(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor {
    return UIColor.init(red: r, green: g, blue: b, alpha: a)
}

public func POSTNOTI(name:String)
{
    NSNotificationCenter.defaultCenter().postNotificationName(name, object: nil)
}

public func getImageFromURLStr(URLStr:String) -> UIImage {
    let url = NSURL.init(string: URLStr)
    let request = NSURLRequest(URL: url!)
    var image = UIImage()
    
    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response:NSURLResponse?, data:NSData?, error:NSError?) ->Void in
        do
        {
          try image = UIImage.init(data: data!)!
        }catch
        {
            
        }
        
    }
    PRINT(image)
    return image
    
}






        