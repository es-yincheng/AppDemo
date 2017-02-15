//
//  UIImage+Extensions.swift
//  WeiboDemo
//
//  Created by 尹成 on 2017/1/19.
//  Copyright © 2017年 yc. All rights reserved.
import UIKit

extension UIImage{
    
    
    // FIXME: 在图像表格cell 中 测试
    
    /// 转换图片大小，解决 Color Misaligned Images 问题
    ///
    /// - Parameter size: 目标大小
    /// - Returns: 拉伸后图片
    func yc_avatarImage(size:CGSize?,
                        backColor:UIColor=UIColor.white,
                        lineColor:UIColor=UIColor.lightGray)-> UIImage? {
        
//        UIColor(red: 242, green: 242, blue: 242, alpha: 1.0)
        
        var size = size
        if size == nil {
            size = self.size
        }
        
        let rect = CGRect(origin: CGPoint(), size: size!)
        
        //获取上下文
        /**A
         参数：
         size:绘图的尺寸
         不透明：false(透明)，true（不透明）
         scale：屏幕分辨率，默认生成图像默认使用1.0（图像质量不好）的分辨率
         可以制定0，会选择当前屏幕分辨率绘制
         */
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        
        //填充背景颜色
        backColor.setFill()
        UIRectFill(rect)
        
        // 判断是否需要圆形图像
        
        //->1.实例化一个圆形路径
        let path = UIBezierPath(ovalIn: rect)
        
        //->2.进行路径裁切, 后续的绘图，都会出现在圆形路境内，外部的会被裁切
        path.addClip()
        
        //2. 绘图 ,drawInReact :在指定区域内拉伸
        draw(in: rect)
        
        let ovalPath = UIBezierPath(ovalIn: rect)
        //->3.绘制内切的圆形
        ovalPath.lineWidth = 2
        lineColor.setStroke()
        ovalPath.stroke()
        
        //3. 取得结果
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        //4. 关闭上下文
        UIGraphicsEndImageContext()
        
        //5. 返回结果
        
        return result
    }
}
