//
//  HTTPRequestManager.swift
//  上路啦
//
//  Created by ChampOn on 16/7/25.
//  Copyright © 2016年 com.champon. All rights reserved.
//

import UIKit





class HTTPRequestManager: NSObject {

    static let instance = HTTPRequestManager()//swift中var建单例的方法
    
    //目的地
    func sendRequestForDestination()   {
        
        
        let URL:NSURL = NSURL.init(string: DESTINATIONPATH)!
        let request = NSMutableURLRequest.init(URL: URL)
        request.HTTPMethod = "GET"
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration)
        let task:NSURLSessionDataTask = session.dataTaskWithRequest(request) { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            do {
                let dic:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
                let arr:[NSDictionary] = dic["data"] as! Array
                PRINT(arr)
                
                
            }catch
            {
                PRINT("捕获到异常")
            }
        }
        task.resume()
        
        
        
    }
}
