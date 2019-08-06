//
//  XYZShareEnum.swift
//  XYZShareTool
//
//  Created by 张小杨 on 2019/8/5.
//  Copyright © 2019 张小杨. All rights reserved.
//

import UIKit

//MARK: -平台枚举
public enum XYZSharePlateformEnum: String {
    case wechat = "微信"
    case wechatTimeline = "朋友圈"
    case sinaWeibo = "微博"
    case qqFriend = "QQ"
    case qqZone = "QQ空间"
    case myPlate = "自己公司的平台" //自己的平台,类似腾讯有微信,qq
    case none = ""
    
    func info() -> (title: String, icon: UIImage?) {
        switch self {
        case .wechat:
            return ("微信", UIImage.init(named: "assistant_share_wechat"))
        case .qqFriend:
            return ("QQ", UIImage.init(named: "assistant_share_QQ"))
        case .wechatTimeline:
             return ("朋友圈", UIImage.init(named: "assistant_share_friend"))
        case .sinaWeibo:
            return ("微博", UIImage.init(named: "assistant_share_weibo"))
        case .qqZone:
             return ("QQ空间", UIImage.init(named: "assistant_share_qqZone"))
        case .myPlate:
            return ("自己", UIImage.init(named: "assistant_location"))
        case .none:
            return ("", nil)
        
        }
    }
}


//MARK:- 功能按钮枚举
public enum XYZShareToolEnum: String {
    case copyLink = "复制"
    case delete = "删除"
    case report = "举报"
    case savePhoto = "保存"
    case longPhoto = "长图"
    
    func info() -> (title: String, icon: UIImage?) {
        switch self {
        case .copyLink:
            return ("复制", UIImage.init(named: "assistant_share_copyLink"))
        case .delete:
            return ("删除", UIImage.init(named: "assistant_share_delete"))
        case .report:
            return ("举报", UIImage.init(named: "assistant_share_report"))
        case .savePhoto:
            return ("保存", UIImage.init(named: "assistant_share_savePhoto"))
        case .longPhoto:
            return ("长图", UIImage.init(named: "assistant_share_savePhoto"))
            
        }
    }
}


//MARK: -使用场景
public enum XYZShareViewType: Int {
    case basic = 0 //包含：微信、朋友圈、QQ、QQ空间、新浪微博
    case myItem = 1 //自己的平台
    
    func items() -> [XYZSharePlateformEnum] {
        switch self {
        case .basic:
            return [.wechat, .wechatTimeline, .sinaWeibo, .qqFriend, .qqZone]
        case .myItem:
            return [.myPlate, .wechat, .wechatTimeline, .sinaWeibo, .qqFriend, .qqZone]
        }
    }
}


//MARK: -ShareInfo:分享的信息内容
public enum XYZShareContentType {
    case text
    case image
    case url
}

