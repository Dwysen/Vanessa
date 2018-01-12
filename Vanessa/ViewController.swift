
//
//  Created by 王彦森 on 2017/12/25.
//  Copyright © 2017年 Dwyson. All rights reserved.
//

import UIKit
import CollectionKit
import Foundation

class ViewController: UIViewController {
    
    var strProvider = ArrayDataProvider.init(data: ["str"])
    
    private var collectionView : CollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userDefault = UserDefaults.standard.object(forKey: "strArr") {
            
            strProvider = ArrayDataProvider.init(data: userDefault as! [String])
            
        }
        
        collectionView = CollectionView.init(frame: CGRect.init(x: 0, y: 20, width: UIScreen.main.bounds.width, height: Common.collectionViewHeight))
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10)
        view.addSubview(collectionView)
        
        let reloadBtn = UIButton(frame: CGRect(x: 0, y: Common.screenHeight - 66, width: Common.screenWidth, height: 66))
        reloadBtn.setImage(UIImage.init(named: "Add") , for: .normal)
        reloadBtn.setTitleColor(UIColor.white, for: .normal)
        reloadBtn.backgroundColor = UIColor.black
        reloadBtn.addTarget(self, action: #selector(reload), for: .touchUpInside)
        view.addSubview(reloadBtn)
        
        let provider = CollectionProvider(
            dataProvider: strProvider, // provide an array of data, data can be any type
            
            viewUpdater: { (view: CardView, data: String , at: Int) in
                view.populate(title: data)
                
        },
            layout: WaterfallLayout<String>(columns: 3).transposed(),
            sizeProvider: { (index: Int, data: String, collectionSize: CGSize) -> CGSize in
                
                var width = Common.caculateWidth(str: data)
                
                if width < Common.cellHeight {
                    
                    width = Common.cellHeight
                    
                }
                
                return CGSize(width: width + 20, height: Common.cellHeight) // return your cell size
                
        }
        )
        
        provider.tapHandler = { [weak self] (view, index, _) in
            
            let deleteAlert = UIAlertController.init(title: "删了？", message: nil, preferredStyle: .alert)
            
            let action = UIAlertAction.init(title: "确定", style: .default) { (act) in
                
                self?.strProvider.data.remove(at: index)
                
                UserDefaults.standard.set(self?.strProvider.data, forKey: "strArr")
                
                self?.collectionView.reloadData()
                
                deleteAlert.dismiss(animated: true, completion: nil)
                
            }
            
            let cancelAction = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
            
            deleteAlert.addAction(action)
            
            deleteAlert.addAction(cancelAction)
            
            self?.present(deleteAlert, animated: true, completion: nil)
            
        }
        
        let presenter = WobblePresenter()
        presenter.insertAnimation = .scale
        presenter.deleteAnimation = .fade
        
        provider.presenter = presenter
        collectionView.provider = provider
        
    }
    
    @objc func reload(){
        
        let alertInput = UIAlertController.init(title: "又想写点啥？", message: nil, preferredStyle: .alert)
        
        alertInput.addTextField(configurationHandler: nil)
        
        let action = UIAlertAction.init(title: "确定", style: .default) { (act) in
            
            let textInputText = alertInput.textFields?.first?.text
            
            self.strProvider.data.append(textInputText!)
            
            UserDefaults.standard.set(self.strProvider.data, forKey: "strArr")
        
            self.collectionView.reloadData()
            
            self.collectionView.scrollTo(edge: .right, animated: true)
            
            alertInput.dismiss(animated: true, completion: nil)
            
        }
        
        alertInput.addAction(action)
        
        self.present(alertInput, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
