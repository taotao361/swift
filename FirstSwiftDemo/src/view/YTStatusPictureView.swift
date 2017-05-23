//
//  YTStatusPictureView.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/22.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit
import Kingfisher

let PictureViewCellReuseIdentifier = "PictureViewCellReuseIdentifier"

class YTStatusPictureView: UICollectionView {

    var status : YTStatus? {
        didSet {
            self.reloadData()
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("====")
    }
    
    fileprivate var pictureLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    init() {
        super.init(frame: CGRect.zero, collectionViewLayout: pictureLayout)
        register(PictureCollectionCell.self, forCellWithReuseIdentifier: PictureViewCellReuseIdentifier)
        dataSource = self
        delegate = self
        pictureLayout.minimumInteritemSpacing = 5
        pictureLayout.minimumLineSpacing = 5
        backgroundColor = UIColor.clear
    }

    func calculateImageSize () -> CGSize {
        let count = status?.storedPicUrls?.count
        if count == 0 || count == nil {
            return CGSize.zero
        }
        if count == 1 {
//            let key = status?.storedPicUrls?.first?.absoluteString
//            let image = KingfisherManager.shared.cache.retrieveImageInDiskCache(forKey: key!)
//            pictureLayout.itemSize = image!.size
//            return image!.size
            return CGSize.init(width: 90, height: 90)
        }
         let margin : CGFloat = 5.0
        if count == 4 || count == 2 {
            let cellWidth : CGFloat = 90.0
            pictureLayout.itemSize = CGSize.init(width: cellWidth, height: cellWidth)
            let viewWidth = cellWidth*2 + margin
            return CGSize.init(width: viewWidth, height: viewWidth*CGFloat.init(count! / 4))
        }
        
        let rowNumber = count! / 3 //一行共3个，共几行
        let viewWidth = UIScreen.main.bounds.width - 2*margin
        let cellWidth = viewWidth/3 - margin
        let viewHeight = cellWidth * CGFloat.init(rowNumber)
        pictureLayout.itemSize = CGSize.init(width: cellWidth, height: cellWidth)
        return CGSize.init(width: viewWidth, height: viewHeight)
    }
    
    
}


let StatusPictureViewSelected = "StatusPictureViewSelected"
//MARK: - 当前选中图片的索引
let StatusPictureViewIndexKey = "StatusPictureViewIndexKey"
//MARK: - 本条所有大图的数组
let StatusPictureViewURLsKey = "StatusPictureViewURLsKey"

extension YTStatusPictureView : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.status?.storedPicUrls?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureViewCellReuseIdentifier, for: indexPath) as! PictureCollectionCell
        cell.imageUrl = status?.storedPicUrls![indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
}






fileprivate class PictureCollectionCell : UICollectionViewCell {
    var imageUrl : URL? {
        didSet {
            iconImageView.kf.setImage(with: imageUrl!)
            if (imageUrl!.absoluteString as NSString).pathExtension.lowercased() == "gif" {
                gifView.isHidden = false
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func loadUI () {
        contentView.clipsToBounds = true
        contentView.addSubview(iconImageView)
        contentView.addSubview(gifView)
        iconImageView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(contentView)
            make.right.left.equalTo(contentView)
        }
        
        gifView.snp.makeConstraints { (make) in
            make.right.equalTo(iconImageView.snp.right)
            make.bottom.equalTo(iconImageView.snp.bottom)
            make.height.equalTo(10)
            make.width.equalTo(20)
        }
        
    }
    
    
    fileprivate lazy var iconImageView : UIImageView = {
        let imageView = UIImageView.init()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    fileprivate lazy var gifView : UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor ( red: 0.3406, green: 0.7527, blue: 0.9988, alpha: 0.729544974662162 )
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 8)
        label.isHidden = true
        return label
    }()
}









