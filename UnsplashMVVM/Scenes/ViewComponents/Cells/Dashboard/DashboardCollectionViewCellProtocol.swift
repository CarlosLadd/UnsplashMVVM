//
//  DashboardCollectionViewCellProtocol.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

protocol DashboardCollectionViewCellProtocol {
    
    var coverImageView: UIImageView! { get set }
    var viewModel: DashboardCellViewModelProtocol? { get set }
    
}
