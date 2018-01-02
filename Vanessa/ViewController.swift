
//
//  Created by 王彦森 on 2017/12/25.
//  Copyright © 2017年 Dwyson. All rights reserved.
//

import UIKit
import CollectionKit

class ViewController: UIViewController {
    
    private var collectionView : CollectionView!
    
    private let dataProvider = ArrayDataProvider.init(data: testImagee)
    
    let imgHeight : CGFloat = (300 - 40) / 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = CollectionView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300))
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10)
        view.addSubview(collectionView)
        
        let reloadBtn = UIButton(frame: CGRect(x: 10, y: 320, width: UIScreen.main.bounds.width - 20, height: 40))
        reloadBtn.setTitle("Add One", for: .normal)
        reloadBtn.setTitleColor(UIColor.white, for: .normal)
        reloadBtn.backgroundColor = UIColor.red
        reloadBtn.addTarget(self, action: #selector(reload), for: .touchUpInside)
        view.addSubview(reloadBtn)
        
        
        let provider = CollectionProvider(
            dataProvider: dataProvider,
            viewGenerator: { (data, index) -> UIImageView in
                let view = UIImageView()
                view.layer.cornerRadius = 5
                view.clipsToBounds = true
                return view
        },
            viewUpdater: { (view: UIImageView, data: UIImage, at: Int) in
                view.image = data
        })
        
        provider.layout = WaterfallLayout<UIImage>(columns: 3).transposed()
        provider.sizeProvider = imageSizeProvider
        provider.tapHandler = { [weak self] (view, index, _) in
            self?.dataProvider.data.remove(at: index)
            self?.collectionView.reloadData()
        }
        
        let presenter = WobblePresenter()
        presenter.insertAnimation = .scale
        presenter.deleteAnimation = .fade
        
        provider.presenter = presenter
        collectionView.provider = provider
        
    }
    
    @objc func reload(){
        
        dataProvider.data.append(UIImage.init(named: "qop")!)
        collectionView.reloadData()
        collectionView.scrollTo(edge: .right, animated: true)
    }
    
    func imageSizeProvider(at: Int, data: UIImage, collectionSize: CGSize) -> CGSize {
        var imageSize = data.size
        
        if imageSize.height > imgHeight {
            
            imageSize.width = imageSize.width * ( imgHeight / imageSize.height)
            imageSize.height = imgHeight
            
        } else {
            
            imageSize.width = imageSize.width * ( imgHeight / imageSize.height  )
            imageSize.height = imgHeight
        }
        
        return imageSize
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

