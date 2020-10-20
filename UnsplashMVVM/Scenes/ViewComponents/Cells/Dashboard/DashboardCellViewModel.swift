//
//  DashboardCellViewModel.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

protocol DashboardCellViewModelProtocol {
    
    var coverURL: String? { get }
    
}

final class DashboardCellViewModel: DashboardCellViewModelProtocol {
    
    let coverURL: String?
    
    init(_ image: DLImage) {
        coverURL = image.urls.small
    }
    
}
