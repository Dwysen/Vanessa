


import UIKit
import CollectionKit

open class ZoomPresenter: CollectionPresenter {
    open override func update(collectionView: CollectionView, view: UIView, at: Int, frame: CGRect) {
        super.update(collectionView: collectionView, view: view, at: at, frame: frame)
        let bounds = CGRect(origin: .zero, size: collectionView.bounds.size)
        let absolutePosition = frame.center - collectionView.contentOffset
        let scale = 1 - max(0, absolutePosition.distance(bounds.center) - 150) / (max(bounds.width, bounds.height) - 150)
        view.transform = CGAffineTransform.identity.scaledBy(x: scale, y: scale)
    }
}

