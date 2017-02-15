//
//  YCNavigationController.swift
//  AppDemo
//
//  Created by 尹成 on 2017/2/14.
//  Copyright © 2017年 yc. All rights reserved.
//

import UIKit

class YCNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if viewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            
            var titleStr = "返回"
            if childViewControllers.count == 1 {
                titleStr = childViewControllers.first?.title ?? titleStr
            }
            
            if let vc = viewController as? YCBaseViewController {
                
                vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: titleStr as NSString,
                                                                      target: self,
                                                                      action: #selector(popBack),
                                                                      isBack:true)
                // 自定义item后 需要手动开启手势返回功能
                /**
                 、用自定义的 UIBarButtonItem 替换 navigationController 的 backBarButtonItem 记住是 backBarButtonItem 而不是 leftBarButtonItem ，如果你不小心替换成了 leftBarButtonItem ，那么会直接导致侧滑手势失效。有关 backBarButtonItem 和 leftBarButtonItem的区别可以参考这篇文章。
                 */
                interactivePopGestureRecognizer?.isEnabled = true
            }
            
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc private func popBack(){
        popViewController(animated: true)
    }

}
