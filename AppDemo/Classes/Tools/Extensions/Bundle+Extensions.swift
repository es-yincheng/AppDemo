//
//  Bundle+Extensions.swift
//  WeiboDemo
//
//  Created by 尹成 on 2017/1/6.
//  Copyright © 2017年 yc. All rights reserved.
//

import Foundation
import UIKit

extension Bundle{
    
    
    func jump(classNameString:String,from:UIViewController) -> () {
        
        print("线程:",Thread.current.threadDictionary)
        print("--:",Thread.callStackSymbols)
        
        let allNameString = spaceName + "." + classNameString
        
        if classNameString.contains("ViewController") {
            let cls = NSClassFromString(allNameString) as? UIViewController.Type
            
             let vc = cls?.init()
            from.navigationController?.pushViewController(vc!, animated: true)
        }
        return;
    }
    
    /// 通过字符串创建对应类,类名必须包含该类型后缀,如:HomeViewController,必须包含ViewController
    ///
    /// - Parameter classNameString: 类名字符串
    /// - Returns: 实例化对象
    func createClass(classNameString:String) -> (Any?) {
        
        let allNameString = spaceName + "." + classNameString
        
        if classNameString.contains("ViewController") {
            let cls = NSClassFromString(allNameString) as? UIViewController.Type
            
            return cls?.init()
        }
        else if classNameString.contains("TableViewCell") {
            let cls = NSClassFromString(allNameString) as? UITableViewCell.Type
            
            return cls?.init()
        }
        else  {
            let cls = NSClassFromString(allNameString) as? NSObject.Type
            
            return cls?.init()
        }
        
    }
    //只读属性
    var identifier:String{
        return infoDictionary?["CFBundleIdentifier"] as? String ?? ""
    }
    var spaceName:String{
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    var appVersion:String{
        return infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    var buildVersion:String{
        return infoDictionary?["CFBundleVersion"] as? String ?? ""
    }
    
}
