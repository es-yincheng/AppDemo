//
//  YCBaseViewController.swift
//  AppDemo
//
//  Created by 尹成 on 2017/2/14.
//  Copyright © 2017年 yc. All rights reserved.
//

import UIKit

class YCBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    var tableView:UITableView?
    var refreshControl:UIRefreshControl?
}

// MARK: - 设置界面
extension YCBaseViewController{
    
    func setUpUI() {
        
        print("father setUpUI")
    }
    
    func tableViewRegister(cellClasses:NSMutableArray, cellNames:NSMutableArray) {
        setUpTableView(cellClasses: cellClasses,
                       cellNames: cellNames)
    }
    
    private func setUpTableView(cellClasses:NSMutableArray,cellNames:NSMutableArray){
        
        tableView = UITableView(frame: view.bounds,
                                style: .plain)
        view.addSubview(tableView!)
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        refreshControl = UIRefreshControl()
        tableView?.addSubview(refreshControl!)
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
        
        for cellClass in cellClasses {
            
            let cellId = String(describing: cellClass) + "ID"
            
            tableView?.register((cellClass as! AnyClass), forCellReuseIdentifier: cellId)
        }
        
        for cellName in cellNames {
            
            let cellId = (cellName as! String) + "ID"
            
            tableView?.register(UINib(nibName: cellName as! String, bundle: nil), forCellReuseIdentifier: cellId)
            
        }
        
    }
}


// MARK: - action , 自定义方法
extension YCBaseViewController{
    
    @objc func loadData(){
        
        refreshControl?.endRefreshing()
    }
}

// MARK: - UITableViewDelegate,UITableViewDataSource
extension YCBaseViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
}
