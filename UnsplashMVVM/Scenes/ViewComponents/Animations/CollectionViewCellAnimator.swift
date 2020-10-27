//
//  CollectionViewCellAnimator.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/26/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

class CollectionViewCellAnimator {
    
    class func fadeAnimate(cell: UICollectionViewCell) {
        let view = cell.contentView
        view.layer.opacity = 0.1
        UIView.animateKeyframes(withDuration: 0.5, delay: 0.0, options: .allowUserInteraction, animations: {
            view.layer.opacity = 1
        }, completion: nil)
    }
    
}
