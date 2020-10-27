//
//  Dequeuable.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

protocol Dequeuable {
    
    static var dequeuIdentifier: String { get }
    
}

extension Dequeuable where Self: UIView {
    
    static var dequeuIdentifier: String {
        return String(describing: self)
    }
    
}

extension UICollectionViewCell: Dequeuable { }
