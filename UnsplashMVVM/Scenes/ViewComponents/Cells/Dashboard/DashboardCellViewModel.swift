//
//  DashboardCellViewModel.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

protocol DashboardCellViewModelProtocol {
    
    var coverURL: URL? { get }
    
}

final class DashboardCellViewModel: DashboardCellViewModelProtocol {
    
    let coverURL: URL?
    
    init(_ image: DLImage) {
        coverURL = URL(string: image.urls.small)
    }
    
}
