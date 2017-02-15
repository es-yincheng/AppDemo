//
//  YCAnimationVC.swift
//  AppDemo
//
//  Created by 尹成 on 2017/2/14.
//  Copyright © 2017年 yc. All rights reserved.
//

import UIKit

class YCAnimationVC: YCBaseViewController {
    
}


// MARK: - 设置界面
extension YCAnimationVC{
    
    override func setUpUI() {
        view.backgroundColor = UIColor.blue

        let bt = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
        bt.backgroundColor = UIColor.red
        view.addSubview(bt)
        
        bt.addTarget(self, action: #selector(jump), for: .touchUpInside)
        
    }
    
    @objc private func jump(){
        let vc = YCTestViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
