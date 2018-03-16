//
//  SetingViewController.swift
//  ColorTool
//
//  Created by 秦国华 on 2018/3/14.
//  Copyright © 2018年 秦国华. All rights reserved.
//

import UIKit

class SetingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView :UITableView!
    var headImgView :UIImageView!
    let identifier = "setingCellID"

    
//    var dataArray:Array<Any>!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.initViews()
    }
    
    func initViews() {
        self.tableView = UITableView.init(frame: self.view.bounds, style: .grouped)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.showsHorizontalScrollIndicator = false
        self.tableView.estimatedRowHeight = 0
        self.tableView.estimatedSectionFooterHeight = 0
        self.tableView.estimatedSectionHeaderHeight = 0
        
        self.view.addSubview(self.tableView)
        
//        self.tableView.register(SetingCell(), forCellReuseIdentifier: identifier)
        
        self.headImgView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_W, height: 250.0))
        self.headImgView.image = UIImage.init(named: "defaultImage")
        self.tableView.tableHeaderView = self.headImgView
        
        
    }
    lazy var dataArray: Array = {() -> Array<Any> in
        let datas = ["简介","版本","",""]
        return datas
    }()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) //as! SetingCell
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        cell?.selectionStyle = .none
        cell?.accessoryType = .disclosureIndicator
        cell?.textLabel?.text = self.dataArray[indexPath.row] as? String
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}