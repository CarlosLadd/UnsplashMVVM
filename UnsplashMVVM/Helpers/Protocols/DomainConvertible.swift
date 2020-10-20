//
//  DomainConvertible.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/20/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

protocol DomainConvertible {
    
    associatedtype Domain
    
    func asDomain() -> Domain
    
}
