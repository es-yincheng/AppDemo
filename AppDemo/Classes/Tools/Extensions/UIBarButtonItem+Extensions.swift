//
//  UIBarButtonItem+Extensions.swift
//  WeiboDemo
//
//  Created by 尹成 on 2017/1/9.
//  Copyright © 2017年 yc. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    //convenience
    convenience init(title:NSString="",
                     font:UIFont=UIFont.systemFont(ofSize: 14),
                     normalColor:UIColor=UIColor.darkGray,
                     highlightedColor:UIColor=UIColor.orange,
                     normalImage:NSString="",
                     highlightedImage:NSString="",
                     target:AnyObject?,
                     action:Selector,
                     isBack:Bool=false) {
        
        let button = UIButton()
        
        button.titleLabel?.font = font
        
        if title.length > 0 {
            button.setTitle(title as String, for: .normal)
            button.setTitleColor(normalColor, for: .normal)
            button.setTitleColor(highlightedColor, for: .highlighted)
        }
        
        if normalImage.length > 0 {
            button.setImage(UIImage(named:normalImage as String), for: .normal)
        }
        
        if highlightedImage.length > 0 {
            button.setImage(UIImage(named:highlightedImage as String), for: .highlighted)
        }
        
        if isBack {
            /////
            button.setImage(UIImage(named:"navigationbar_back_withtext" as String), for: .normal)
            button.setImage(UIImage(named:"navigationbar_back_withtext_highlighted" as String), for: .highlighted)
        }
        
        button.addTarget(target, action: action, for: .touchUpInside)
        
        button.sizeToFit()
        
        self.init(customView: button)
        
    }
}
