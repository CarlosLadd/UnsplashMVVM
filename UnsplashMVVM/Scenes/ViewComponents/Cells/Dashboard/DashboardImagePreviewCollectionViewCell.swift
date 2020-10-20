//
//  DashboardImagePreviewCollectionViewCell.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

class DashboardImagePreviewCollectionViewCell: UICollectionViewCell,
DashboardCollectionViewCellProtocol {
    
    var viewModel: DashboardCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.coverImageView = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        self.coverImageView.layer.cornerRadius = 10.0
        self.coverImageView.layer.masksToBounds = true
    }
    
    // MARK: - Bindables
    
    private func setupBindables() {
        guard let viewModel = viewModel else { return }
        
        if let coverURL = viewModel.coverURL {
            let imageURL = URL(string: coverURL)
            self.coverImageView.setImage(with: imageURL)
        }
    }
    
}
