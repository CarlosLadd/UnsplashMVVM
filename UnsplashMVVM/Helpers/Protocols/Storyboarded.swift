//
//  Storyboarded.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/23/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

protocol Storyboarded {
    
    static var storyboardName: String { get }
    static func instantiate() -> Self
    
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]

        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)

        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
    
}
