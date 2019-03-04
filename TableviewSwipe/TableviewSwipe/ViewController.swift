//
//  ViewController.swift
//  TableviewSwipe
//
//  Created by MAC on 04/03/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell") as! MyTableViewCell
        
        let remove:UIButton = UIButton()
        remove.setTitle(NSLocalizedString("Remove", comment: ""), for: .normal)
        remove.backgroundColor = UIColor.white
        remove.tag = indexPath.row
        remove.backgroundColor = UIColor.red
        remove.setImage(UIImage(named:"icon_delete"), for: .normal)
        remove.titleEdgeInsets = UIEdgeInsetsMake(0.0, 10.0, 0.0, 0.0)
        remove.imageEdgeInsets = UIEdgeInsetsMake(0.0, -5.0, 0.0, 0.0)
//        remove.addTarget(self, action: #selector(RemoveRecordedFile(sender:)), for: .touchUpInside)
        
        let share:UIButton = UIButton()
        share.setTitle(NSLocalizedString("Share", comment: ""), for: .normal)
        share.backgroundColor = UIColor.white
        share.tag = indexPath.row
        share.backgroundColor = UIColor.red
        share.setImage(UIImage(named:"ic_share"), for: .normal)
        share.titleEdgeInsets = UIEdgeInsetsMake(0.0, 10.0, 0.0, 0.0)
        share.imageEdgeInsets = UIEdgeInsetsMake(5.0, -5.0, 5.0, -10.0)
//        share.addTarget(self, action: #selector(ShareRecordedFile(sender:)), for: .touchUpInside)
        
        if UI_USER_INTERFACE_IDIOM() == .pad {
            remove.frame = CGRect(x: self.myTableView.frame.size.width+10, y: 0, width: 200, height: (cell.contentView.frame.size.height)-2)
            remove.titleLabel?.font = UIFont(name: "SourceSansPro", size: 26.0)
            
            share.frame = CGRect(x: remove.frame.origin.x+200, y: 0, width: 190, height: (cell.contentView.frame.size.height)-2)
            share.titleLabel?.font = UIFont(name: "SourceSansPro", size: 26.0)
        }
        else{
            remove.frame = CGRect(x: self.myTableView.frame.size.width+10, y:-8.0, width: 150, height: (cell.contentView.frame.size.height)-1)
            remove.titleLabel?.font = UIFont(name: "SourceSansPro", size: 15.0)
            
            share.frame = CGRect(x: remove.frame.origin.x+150, y: -8.0, width: 130, height: (cell.contentView.frame.size.height)-1)
            share.titleLabel?.font = UIFont(name: "SourceSansPro", size: 15.0)
        }
        
        cell.mainScrollView.addSubview(remove)
        cell.mainScrollView.addSubview(share)
        
        
        cell.mainScrollView.contentSize = CGSize(width: share.frame.size.width + share.frame.origin.x + 10, height: (cell.mainScrollView.frame.size.height))
        
        cell.mainScrollView.tag = indexPath.row
        cell.mainScrollView.delegate = self
        cell.mainScrollView.setContentOffset(CGPoint.zero, animated: false)
        cell.mainScrollView.delaysContentTouches = false
        cell.mainScrollView.decelerationRate = UIScrollViewDecelerationRateNormal
        cell.mainScrollView.bounces = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}

