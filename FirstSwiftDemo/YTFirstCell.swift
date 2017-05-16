//
//  YTFirstCell.swift
//  FirstSwiftDemo
//
//  Created by yangxutao on 2017/5/16.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

import UIKit



class YTFirstCell: UITableViewCell {
    
    var labe1 : UILabel
    var label2 : UILabel

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self.labe1 = UILabel()
        self.label2 = UILabel.init()
       
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.labe1 = UILabel()
        self.label2 = UILabel.init()
        super.init(coder: aDecoder)
    }
    
    fileprivate func initUI() {
        let label1 : UILabel = UILabel.init()
        label1.textColor = UIColor.red
        label1.textAlignment = NSTextAlignment.center
        label1.backgroundColor = UIColor.gray
        
        let label2 : UILabel = UILabel.init()
        label2.textAlignment = NSTextAlignment.center
        label2.textColor = UIColor.purple
        label2.backgroundColor = UIColor.yellow
        
        label1.frame = CGRect.init(x: 30, y: 5, width: 40, height: 30)
        label2.frame = CGRect.init(x: 30, y: 40, width: 40, height: 30)
        self.addSubview(label1)
        self.addSubview(label2)
        self.labe1 = label1
        self.label2 = label2

    }
    

    
    
    
    
    
    func refreshItem(model : YTTestModel)  {
        self.labe1.text = model.name
        self.label2.text = model.detail
    }
    
    
    
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
