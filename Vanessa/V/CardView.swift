//
//  CardView.swift
//  Vanessa
//
//  Created by 王彦森 on 2018/1/12.
//  Copyright © 2018年 Dwyson. All rights reserved.
//

import UIKit
import Foundation

class CardView: UIView {
    
    var label : UILabel!
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .boldSystemFont(ofSize: 17)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor.white
    
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let colorIndex = arc4random_uniform(UInt32(Common.colorArr.count))
        backgroundColor = Common.colorArr[Int(colorIndex)]
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        addSubview(titleLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populate(title:String){
        
        titleLabel.attributedText = Common.getAttributeStringWithString(title, lineSpace: 8)
        titleLabel.textAlignment = .center
        
    }
    
    override func layoutSubviews() {
        titleLabel.frame = CGRect(x: 10, y: 10, width: bounds.width - 20, height: bounds.height - 20)
    }
    
}

