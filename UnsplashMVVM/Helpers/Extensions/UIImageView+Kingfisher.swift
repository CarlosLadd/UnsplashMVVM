//
//  UIImageView+Kingfisher.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/20/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func setImage(with url: URL?) {
        kf.indicatorType = .activity
        kf.setImage(with: url)
    }
    
}
