//
//  DestinationViewController.swift
//  上路啦
//
//  Created by ChampOn on 16/7/14.
//  Copyright © 2016年 com.champon. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController,UITextFieldDelegate {

    let firstCellID = "firstCellID"
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    let headerView = UIView()
    
    var textField = UITextField()
    //大数据源
    var dataSource:[CountryModel] = []
    var index = 0
    var destinationModel = DestinationModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        self.sendRequestForDestination()
    }
    private func setUI()  {
        self.navigationController?.navigationBarHidden = true
        self.searchBar.layer.masksToBounds = true
        self.searchBar.layer.cornerRadius = 5.0
        let searchField = self.searchBar.valueForKey("_searchField")as!UITextField
        self.searchBar.userInteractionEnabled = false
        textField = searchField
        searchField.delegate = self
        searchField.attributedPlaceholder = NSAttributedString.init(string: "搜索目的地", attributes: [NSForegroundColorAttributeName:UIColor.whiteColor()])
        
        //对collectionview布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake((WIDTH-30)/2, (WIDTH-30)/2*1.3);
        layout.sectionInset = UIEdgeInsetsMake(10, 5, 0, 5);
        layout.headerReferenceSize = CGSizeMake(WIDTH, WIDTH*1.2);
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
        collectionView.delegate = self
        collectionView.dataSource = self
        
//        let headerView = UIView.init(frame: CGRectMake(0, 0, WIDTH, WIDTH*0.75))
//        let mapView = UIImageView.init(frame: headerView.frame)
//        mapView.userInteractionEnabled = true
//        mapView.image = UIImage.init(named: "Map1")
//        headerView.addSubview(mapView)
//        self.view.addSubview(headerView)
//        
//        
//        let countryNames = ["北美洲","南美洲","欧洲","非洲","亚洲","大洋洲","南极洲"]
//        for i in 0...countryNames.count {
//            let button = UIButton.init(type: UIButtonType.Custom)
//            button.tag = i+1
//            button.setImage(UIImage.init(named: "button_back"), forState: UIControlState.Normal)
//            
//            
//        }
        
        
        
        
        
    }
    //collectionView的协议方法
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
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
                //PRINT(arr)
                let dic1 = arr[self.index]
                var arr1 = [[String:AnyObject]]()
                arr1 = dic1["hot_country"] as! Array
                self.destinationModel.hot_country = arr1
                for i in 0...arr1.count-1
                {
                    let dic2 = arr1[i]
                    let model = CountryModel()
                    model.cnname = dic2["cnname"] as! String
                    model.enname = dic2["enname"] as! String
                    model.count = dic2["count"] as! NSNumber
                    model.label = dic2["label"] as! String
                    model.imageURL = dic2["photo"] as! String
                    model.hot_country = arr1
                    self.dataSource.append(model)
                }
                
                
                
            }catch
            {
                PRINT("捕获到异常")
            }
        }
        task.resume()
        
        
        
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
