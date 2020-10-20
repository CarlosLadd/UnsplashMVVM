//
//  DashboardViewModelProtocol.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

// MARK: - View Model Protocol

protocol DashboardViewModelProtocol {
    
    var viewState: Bindable<ListViewState<DLImage>> { get set }
    var startLoading: Bindable<Bool> { get set }
    
    var imageCells: [DashboardCellViewModelProtocol] { get }
    var needsPrefetch: Bool { get }
    
    func getImages()
    func refreshImages()
    
}

// MARK: - Coordinator Protocol

protocol DashboardCoordinatorProtocol: class {
    
    func showImageDetail()
    
}

// MARK: - Interactor Protocol

protocol DashboardInteractorProtocol {
    
    func getImages(page: Int,
                   completion: @escaping (Result<[DLImage], Error>) -> Void)
    
}
