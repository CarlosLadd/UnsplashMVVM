//
//  DashboardViewModelProtocol.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

protocol DashboardViewModelProtocol {
    
    var startLoading: Bindable<Bool> { get set }
    var needsPrefetch: Bool { get }
    
    func getImages()
    func refreshImages()
    
}

protocol DashboardCoordinatorProtocol: class {
    
    func showImageDetail()
    
}
