//
//  YTPresentPhotoController.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/23.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit

private let PhotoBrowserCellReuseIdentifier = "PhotoBrowserCellReuseIdentifier"

class YTPresentPhotoController: YTRootViewController {

    var currentIndex : Int?
    var photoUrls : [URL]?
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.white

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadUI()
    }


    init(index : Int,urls : [URL]) {
        currentIndex = index
        photoUrls = urls
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func loadUI() {
        view.addSubview(collectionView)
        view.addSubview(closeBtn)
        view.addSubview(saveBtn)
        
        closeBtn.snp.makeConstraints { (make) in
            make.right.equalTo(view).offset(-10)
            make.bottom.equalTo(view).offset(-10)
            make.height.equalTo(35)
            make.width.equalTo(100)
        }
        
        saveBtn.snp.makeConstraints { (make) in
            make.size.equalTo(closeBtn)
            make.left.equalTo(view).offset(10)
            make.bottom.equalTo(view).offset(-10)
        }
        
        collectionView.frame = UIScreen.main.bounds
        collectionView.dataSource = self
        collectionView.register(YTPhotoBrowserCell.self, forCellWithReuseIdentifier: PhotoBrowserCellReuseIdentifier)
        
    }
    
    func close() {
        self.dismiss(animated: true) {
        }
    }
    
    @objc fileprivate func save () {
        let indexPath = collectionView.indexPathsForVisibleItems.last!
        let cell = collectionView.cellForItem(at: indexPath) as! YTPhotoBrowserCell
        let image = cell.imageView.image!
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    func image(_ image : UIImage,didFinishSavingWithError error : NSError?,contextInfo : AnyObject) {
        if error != nil {
            print(error ?? "保存失败")
        } else {
            print("success")
        }
    }
    
    
    //懒加载
    fileprivate lazy var closeBtn : UIButton = {
        let btn = UIButton.init()
        btn.setTitle("关闭", for: UIControlState.normal)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.backgroundColor = UIColor.darkGray
        btn.addTarget(self, action: #selector(close), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    fileprivate lazy var saveBtn : UIButton = {
       let btn = UIButton.init()
        btn.setTitle("保存", for: UIControlState.normal)
        btn.setTitleColor(UIColor.red, for: UIControlState.normal)
        btn.backgroundColor = UIColor.gray
        btn.addTarget(self, action: #selector(save), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    fileprivate lazy var collectionView : UICollectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: PhotoBrowserLayout.init())
    
    
    
    
}


extension YTPresentPhotoController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoUrls?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoBrowserCellReuseIdentifier, for: indexPath) as! YTPhotoBrowserCell
        cell.imageUrl = photoUrls![indexPath.item]
        cell.photoBrowserCellDelegate = self as? PhotoBrowserCellDelegate
        return cell
    }
    
    func photoBrowserCellDIdClose(_ cell : YTPhotoBrowserCell) {
        dismiss(animated: true, completion: nil)
    }
    
}


//collectionView layout
class PhotoBrowserLayout: UICollectionViewFlowLayout {
    override func prepare() {
        itemSize = UIScreen.main.bounds.size
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        scrollDirection = UICollectionViewScrollDirection.horizontal
        
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.isPagingEnabled = true
        collectionView?.bounces = false
    }
}












