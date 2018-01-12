//
//  Created by 王彦森 on 2017/12/29.
//  Copyright © 2017年 Dwyson. All rights reserved.
//

import UIKit

struct Common {
    
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    
    // 琉璃，紫苑
    static let colorArr = [UIColor.init(red: 51/255, green: 166/255, blue: 184/255, alpha: 1),UIColor.init(red: 100/255, green: 54/255, blue: 60/255, alpha: 1),UIColor.init(red: 181/255, green: 202/255, blue: 160/255, alpha: 1),UIColor.init(red: 0/255, green: 92/255, blue: 175/255, alpha: 1),UIColor.init(red: 143/255, green: 119/255, blue: 181/255, alpha: 1),UIColor.init(red: 11/255, green: 52/255, blue: 110/255, alpha: 1),UIColor.init(red: 218/255, green: 201/255, blue: 166/255, alpha: 1)]
    
    
    static var testImagee : [UIImage] = [UIImage.init(named: "four")!,UIImage.init(named: "st")!,UIImage.init(named: "stv")!,UIImage.init(named: "sf")!,UIImage.init(named: "qop")!,UIImage.init(named: "stv")!,UIImage.init(named: "st")!,UIImage.init(named: "four")!,UIImage.init(named: "st")!,UIImage.init(named: "stv")!,UIImage.init(named: "sf")!,UIImage.init(named: "qop")!,UIImage.init(named: "stv")!,UIImage.init(named: "st")!,UIImage.init(named: "four")!,UIImage.init(named: "st")!,UIImage.init(named: "stv")!,UIImage.init(named: "sf")!,UIImage.init(named: "qop")!,UIImage.init(named: "stv")!,UIImage.init(named: "st")!,UIImage.init(named: "four")!,UIImage.init(named: "st")!,UIImage.init(named: "stv")!,UIImage.init(named: "sf")!,UIImage.init(named: "qop")!,UIImage.init(named: "stv")!,UIImage.init(named: "st")!,UIImage.init(named: "four")!,UIImage.init(named: "st")!,UIImage.init(named: "stv")!,UIImage.init(named: "sf")!,UIImage.init(named: "qop")!,UIImage.init(named: "stv")!,UIImage.init(named: "st")!,UIImage.init(named: "four")!,UIImage.init(named: "st")!,UIImage.init(named: "stv")!,UIImage.init(named: "sf")!,UIImage.init(named: "qop")!,UIImage.init(named: "stv")!,UIImage.init(named: "st")!]
    
    // 上下间距20，底部按钮高度100
    static let collectionViewHeight:CGFloat =  Common.screenHeight - 40 - 66
    static let rowCount:CGFloat = 3
    static let cellHeight = ( Common.collectionViewHeight - (Common.rowCount + 1) * 10 ) / Common.rowCount
    
    static func getAttributeStringWithString(_ string: String,lineSpace:CGFloat
        ) -> NSAttributedString{
        let attributedString = NSMutableAttributedString(string: string)
        let paragraphStye = NSMutableParagraphStyle()
        
        //调整行间距
        paragraphStye.lineSpacing = lineSpace
        let rang = NSMakeRange(0, CFStringGetLength(string as CFString!))
        
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStye, range: rang)
        return attributedString
        
    }
    
    static func caculateWidth(str:String) -> CGFloat {
        
        let nsStr = NSString.init(string: str)
        
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.lineSpacing = 8
        
        let rect = nsStr.boundingRect(with: CGSize.init(width: 0, height: collectionViewHeight - 40 / 3) , options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 17),NSAttributedStringKey.paragraphStyle:paraStyle], context: nil)
        
        // 显示三行
        return rect.size.width / 3
        
    }
    
    
}





