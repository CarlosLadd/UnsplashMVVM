//
//  VerticalFlowLayout.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

final class VerticalFlowLayout: UICollectionViewFlowLayout {
    
    init(width: Double, height: Double, margin: CGFloat = 16.0) {
        super.init()
        itemSize = CGSize(width: width, height: height)
        sectionInset = UIEdgeInsets(top: margin, left: margin,
                                    bottom: margin, right: margin)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

}
