//
//  YCTabBarController.swift
//  AppDemo
//
//  Created by 尹成 on 2017/2/14.
//  Copyright © 2017年 yc. All rights reserved.
//

import UIKit

class YCTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setChildControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


// MARK: - 设置 controllers
extension YCTabBarController{
    
    fileprivate func setChildControllers(){
        
        let nv = YCNavigationController(rootViewController: YCHomeViewController())
        nv.title = "首页"
        viewControllers = [nv]
        
    }
}
