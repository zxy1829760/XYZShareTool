//
//  XYZShareInfo.swift
//  XYZShareTool
//
//  Created by 张小杨 on 2019/8/6.
//  Copyright © 2019 张小杨. All rights reserved.
//

import UIKit

public class XYZShareInfo: NSObject {

    public var title: String?
    public var content: String?
    public var images: Any?
    public var shareURL: String?
    public var shareType: XYZShareContentType = .text
    
    /*
     convenience:便利，使用convenience修饰的构造函数叫做便利构造函数
     便利构造函数通常用在对系统的类进行构造函数的扩充时使用。
     便利构造函数的特点：
     1、便利构造函数通常都是写在extension里面
     2、便利函数init前面需要加载convenience
     3、在便利构造函数中需要明确的调用self.init()
     */
    public convenience init(title: String? = nil, content: String? = nil, images: Any? = nil, shareURL: String? = nil, shareType: XYZShareContentType = .text) {
        self.init()
        self.title = title
        self.content = content
        self.images = images
        self.shareURL = shareURL
        self.shareType = shareType
    }
    
}
