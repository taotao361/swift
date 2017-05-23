//
//  YTPhotoBrowserCell.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/23.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit


protocol PhotoBrowserCellDelegate : NSObjectProtocol {
    func photoBrowserCellDIdClose(_ cell : YTPhotoBrowserCell)
}


class YTPhotoBrowserCell: UICollectionViewCell {
    
    weak var photoBrowserCellDelegate : PhotoBrowserCellDelegate?
    
    var imageUrl : URL? {
        didSet {
            reset()
            activityIndicatorView.startAnimating()
            imageView.kf.setImage(with: imageUrl, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, url) in
                self.activityIndicatorView.stopAnimating()
                self.setImageViewPosition()
            }
        }
    }
    
    
    fileprivate func reset() {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.contentOffset = CGPoint.zero
        scrollView.contentSize = CGSize.zero
        imageView.transform = CGAffineTransform.identity
    }
    
    fileprivate func displaySize(image : UIImage) -> CGSize {
        let scale = image.size.height / image.size.width
        let width = UIScreen.main.bounds.width
        let height = width * scale
        return CGSize.init(width: width, height: height)
    }
    
    fileprivate func setImageViewPosition () {
        let size = displaySize(image: imageView.image!)
        if size.height < UIScreen.main.bounds.height {
            imageView.frame = CGRect.init(origin: CGPoint.zero, size: size)
            let y = (UIScreen.main.bounds.height - size.height) * 0.5
            self.scrollView.contentInset = UIEdgeInsets.init(top: y, left: 0, bottom: y, right: 0)
        } else {
            imageView.frame = CGRect.init(origin: CGPoint.zero, size: size)
            scrollView.contentSize = size
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func loadUI() {
        contentView.addSubview(scrollView)
        scrollView.addSubview(imageView)
        contentView.addSubview(activityIndicatorView)
        scrollView.frame = UIScreen.main.bounds
        activityIndicatorView.center = contentView.center
        scrollView.delegate = self
        scrollView.maximumZoomScale = 2.0
        scrollView.minimumZoomScale = 0.5
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(close))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
    }
    
    func close() {
//        if self.photoBrowserCellDelegate?.responds(to: photoBrowserCellDelegate?.photoBrowserCellDIdClose(self))
        photoBrowserCellDelegate?.photoBrowserCellDIdClose(self)
    }
   
    //
    fileprivate lazy var scrollView : UIScrollView = UIScrollView.init()
    lazy var imageView = UIImageView.init()
    fileprivate lazy var activityIndicatorView : UIActivityIndicatorView = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    
}

extension YTPhotoBrowserCell : UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        var offsetX = (UIScreen.main.bounds.width - view!.frame.width) * 0.5
        var offsetY = (UIScreen.main.bounds.height - view!.frame.height) * 0.5
        offsetX = offsetX < 0 ? 0 : offsetX
        offsetY = offsetY < 0 ? 0 : offsetY
        scrollView.contentInset = UIEdgeInsets.init(top: offsetY, left: offsetX, bottom: offsetY, right: offsetX)
    }
    
}





