//
//  ViewController.swift
//  XYZShareTool
//
//  Created by 张小杨 on 2019/7/31.
//  Copyright © 2019 张小杨. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var shareBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("分享", for: .normal)
        btn.backgroundColor = UIColor.red
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action: #selector(shareBtnClick), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(shareBtn)
        shareBtn.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
    }
    
    @objc func shareBtnClick() {
        XYZShareViewController.show(vc: self, type: .myItem, tools: [.copyLink, .delete, .report, .longPhoto, .copyLink, .delete, .savePhoto]) { (plate, tool) -> (XYZShareInfo) in
            let info = XYZShareInfo()
            return info
        }
    }


}

