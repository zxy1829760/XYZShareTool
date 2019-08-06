//
//  UIViewController_Extension.swift
//  XYZShareTool
//
//  Created by 张小杨 on 2019/8/6.
//  Copyright © 2019 张小杨. All rights reserved.
//

import UIKit
public extension UIViewController {
    
    /// 屏幕宽高
    var kScreenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    var kScreenHeight: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    /// 顶部安全区域偏移量
    var kSafeAreaTopInset: CGFloat {
        return UIDevice.isIPhoneX ? 44 : 20
    }
    
    /// 底部安全区域偏移量
    var kSafeAreaBottomInset: CGFloat {
        return UIDevice.isIPhoneX ? 34 : 0
    }
    
    var kNavigationBarHeight: CGFloat {
        return UIDevice.isIPhoneX ? 88 : 64
    }
    
    var kTabBarHeight: CGFloat {
        return UIDevice.isIPhoneX ? 49+34 : 49
    }
    
}

