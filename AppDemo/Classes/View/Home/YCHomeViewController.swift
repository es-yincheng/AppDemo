//
//  YCHomeViewController.swift
//  AppDemo
//
//  Created by 尹成 on 2017/2/14.
//  Copyright © 2017年 yc. All rights reserved.
//

import UIKit

private let AnimationCellId = "AnimationCellId"

class YCHomeViewController: YCBaseViewController {
    
}




// MARK: - 设置界面
extension YCHomeViewController{
    
    override func setUpUI() {
        
        title = "xxxx"
        
        view.backgroundColor = UIColor.gray
        
            tableViewRegister(cellClasses: [],
                              cellNames: ["YCGCDCell"])

    }
    
}

extension YCHomeViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 0 {
//            return tableView.dequeueReusableCell(withIdentifier: "AppDemo.YCAnimationCellID", for: indexPath)
//        }
        
        return tableView.dequeueReusableCell(withIdentifier: "YCGCDCellID", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = YCAnimationVC()
        navigationController?.pushViewController(vc, animated: true)
    
    }
}
