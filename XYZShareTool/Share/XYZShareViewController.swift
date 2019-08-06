//
//  XYZShareViewController.swift
//  XYZShareTool
//
//  Created by 张小杨 on 2019/8/5.
//  Copyright © 2019 张小杨. All rights reserved.
//

import UIKit

class XYZShareViewController: UIViewController {
    
    let cellIdentify = "XYZShareItemCell"
    var itemViewHeight: CGFloat {
        let height: CGFloat = self.tools.isEmpty ? 230.0 : 332.0
        return height + kSafeAreaBottomInset
    }
    
    var cancelButtonHeight: CGFloat {
        return 60 + kSafeAreaBottomInset
    }
    
    var itemWidth: CGFloat {
        return (kScreenWidth - 1) / 5.0
    }
    
    var itemHeight: CGFloat {
        return 76
    }
    var collectionHeight: CGFloat {
        return 100
    }
    
    var tools: [XYZShareToolEnum] = []
    var showVC: UIViewController?
    var type: XYZShareViewType = .basic
    var clickItemHandle: ((XYZSharePlateformEnum, XYZShareToolEnum?) -> (XYZShareInfo))?
    
    lazy var markView: UIView = {
        let view = UIView()
        view.alpha = 0
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.text = "分享至"
        label.textAlignment = .center
        return label
    }()
    
    lazy var itemsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.estimatedItemSize = CGSize.zero
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.itemWidth, height: self.itemHeight)
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(XYZShareItemCell.self, forCellWithReuseIdentifier: self.cellIdentify)
        return collectionView
    }()
    
    lazy var toolsCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.estimatedItemSize = CGSize.zero
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.itemWidth, height: self.itemHeight)
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(XYZShareItemCell.self, forCellWithReuseIdentifier: self.cellIdentify)
        return collectionView
    }()
    
    lazy var line: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 245, green: 245, blue: 245, alpha: 1)
        return view
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitle("取消", for: .normal)
        button.setTitleColor(UIColor.init(red: 0, green: 190, blue: 190, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        if UIDevice.isIPhoneX {
            button.titleEdgeInsets = UIEdgeInsets(top: -10, left: 0, bottom: 0, right: 0)
        }
        return button
    }()
    
    convenience init(type: XYZShareViewType) {
        self.init()
        self.type = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSubViews()
    }
    
    public class func show(vc: UIViewController, type: XYZShareViewType = .basic, tools: [XYZShareToolEnum] = [], clickItemHandle: @escaping ((XYZSharePlateformEnum, XYZShareToolEnum?) -> (XYZShareInfo))) {
        let shareUI = XYZShareViewController(type: type)
        shareUI.showVC = vc
        shareUI.tools = tools
        shareUI.clickItemHandle = clickItemHandle
        vc.present(shareUI, animated: false) {
            shareUI.showShareItems()
        }
    }
    
    func showShareItems() {
        UIView.animate(withDuration: 0.25) {
            self.markView.alpha = 1
            self.itemsView.transform = CGAffineTransform(translationX: 0, y: -(self.itemViewHeight))
        }
    }
    
    func hidden(animated: Bool = true, complation:(() -> Void)? = nil) {
        let duration = animated ? 0.25 : 0
        UIView.animate(withDuration: duration, animations: {
            self.markView.alpha = 0
            self.itemsView.transform = CGAffineTransform.identity
            
        }) { (_) in
            self.dismiss(animated: false, completion: {
                complation?()
            })
        }
    }
    
    @objc private func cancelButtonAction() {
        self.hidden()
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.hidden()
    }

}

extension XYZShareViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == toolsCollectionView {
            return tools.count
        }
        return self.type.items().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentify, for: indexPath) as! XYZShareItemCell
        if collectionView == toolsCollectionView {
            cell.titleLabel.text = tools[indexPath.item].info().title
            cell.itemImage.image = tools[indexPath.item].info().icon
            return cell
        }
        cell.titleLabel.text = type.items()[indexPath.item].info().title
        cell.itemImage.image = type.items()[indexPath.item].info().icon
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
}

extension XYZShareViewController {
    func setupSubViews() {
        self.view.backgroundColor = UIColor.clear
        self.view.addSubview(markView)
        markView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.view.addSubview(itemsView)
        itemsView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(self.itemViewHeight)
        }
        
        self.itemsView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(18)
            make.centerX.equalToSuperview()
        }
        
        self.itemsView.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(collectionHeight)
        }
        
        self.itemsView.addSubview(cancelButton)
        cancelButton.snp.makeConstraints { (make) in
            make.trailing.leading.bottom.equalToSuperview()
            make.height.equalTo(self.cancelButtonHeight)
        }
        
        self.itemsView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(cancelButton)
            make.height.equalTo(1)
        }
        
        if !tools.isEmpty {
            self.addTools()
        }
    }
    
    func addTools() {
        self.itemsView.addSubview(toolsCollectionView)
        toolsCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(collectionView.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(collectionHeight)
        }
    }
}
