//
//  SimpleCollectionViewDataSource.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

final class SimpleCollectionViewDataSource<ViewModel>: NSObject, UICollectionViewDataSource {
    
    typealias CellConfigurator = (ViewModel, UICollectionViewCell) -> Void
    
    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator
    
    private var cellViewModels: [ViewModel]
    
    // MARK: - Initializers
    
    init(cellViewModels: [ViewModel],
         reuseIdentifier: String,
         cellConfigurator: @escaping CellConfigurator) {
        self.cellViewModels = cellViewModels
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }
    
    // MARK: - Collection view data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("CELLS COUNT: \(cellViewModels.count)")
        
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = cellViewModels[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cellConfigurator(viewModel, cell)
        return cell
    }

}

// MARK: - Dashboard Images

extension SimpleCollectionViewDataSource where ViewModel == DashboardCellViewModelProtocol {
    
    static func make(for cellViewModels: [ViewModel],
                     presentationMode: DashboardViewController.PresentationMode) -> SimpleCollectionViewDataSource {
        return SimpleCollectionViewDataSource(cellViewModels: cellViewModels,
                                              reuseIdentifier: presentationMode.cellIdentifier,
                                              cellConfigurator: { (viewModel, cell) in
                                                var cell = cell as! DashboardCollectionViewCellProtocol
                                                cell.viewModel = viewModel
        })
    }
    
}
