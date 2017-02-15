////
////  UIImageView+WebImage.swift
////  WeiboDemo
////
////  Created by 尹成 on 2017/1/22.
////  Copyright © 2017年 yc. All rights reserved.
////
//
//import SDWebImage
//
//extension UIImageView{
//    
//    func yc_setImage(urlString:String?,placeholderImage:UIImage?,backColor:UIColor=UIColor.white,isAvatar:Bool=false) {
//        
//        guard let urlString = urlString,
//            let url = URL(string:urlString) else {
//                image = placeholderImage
//                return
//        }
//        
//        sd_setImage(with: url,
//                    placeholderImage: placeholderImage,
//                    options: [],
//                    progress: nil) { (image, _, _, _) in
//                        if isAvatar {
//                            self.image = image?.yc_avatarImage(size: self.bounds.size,
//                                                               backColor: backColor)
//                        }
//        }
//    }
//}
