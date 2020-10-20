//
//  DashboardViewController.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    // Constants
    let previewCellHeight: Double = 150.0
    let imageAspectRatio: Double = 1.5
    
    // ViewModel
    var viewModel: DashboardViewModelProtocol!
    
    // Coordinator
    weak var coordinator: DashboardCoordinatorProtocol?

    // Images CollectionView
    private var collectionView: UICollectionView!
    private var dataSource: SimpleCollectionViewDataSource<DashboardCellViewModelProtocol>!
    private var prefetchDataSource: CollectionViewDataSourcePrefetching!
    
    private var presentationMode: PresentationMode = .preview
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindables()
        
        viewModel?.getImages()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let previewLayoutWidth = previewCellHeight / imageAspectRatio
        let previewLayout = VerticalFlowLayout(width: previewLayoutWidth, height: previewCellHeight)
        
        collectionView = UICollectionView(
            frame: CGRect(x: 0, y: 0, width: view.bounds.height, height: view.bounds.height),
            collectionViewLayout: previewLayout)
        collectionView.backgroundColor = .white
        collectionView.isPrefetchingEnabled = true
        collectionView.delegate = self
        collectionView.registerNib(cellType: DashboardImagePreviewCollectionViewCell.self)
        
        view.addSubview(collectionView)
    }
    
    private func reloadCollectionView() {
        guard let viewModel = viewModel else { return }
        
        dataSource = SimpleCollectionViewDataSource.make(for: viewModel.imageCells,
                                                         presentationMode: presentationMode)
        
        prefetchDataSource = CollectionViewDataSourcePrefetching(
            cellCount: viewModel.imageCells.count,
            needsPrefetch: viewModel.needsPrefetch,
            prefetchHandler: { [weak self] in
                self?.viewModel.getImages()
        })
        
        collectionView.dataSource = dataSource
        collectionView.prefetchDataSource = prefetchDataSource
        collectionView.reloadData()
    }
    
    // MARK: - Current State of the view
    
    private func configureView(withState  state: ListViewState<DLImage>) {
        switch state {
        case .populated, .paging, .initial:
            collectionView.backgroundView = UIView(frame: .zero)
        case .empty:
            collectionView.backgroundView = UIView(frame: .zero)
        case .error:
            collectionView.backgroundView = UIView(frame: .zero)
        }
    }
    
    // MARK: - Bindables
    
    private func setupBindables() {
        viewModel?.viewState.bind({ [weak self] state in
            guard let strongSelf = self else { return }
            
            DispatchQueue.main.async {
                strongSelf.configureView(withState: state)
                strongSelf.reloadCollectionView()
            }
        })
        
        viewModel?.startLoading.bind({ start in
            if start {
                print("Loading Images")
            }
            else {
                print("Images Loaded")
            }
        })
    }

}

// MARK: - UICollectionViewDelegate

extension DashboardViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // Code
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Code
    }
    
}

// MARK: - Presentation Mode

extension DashboardViewController {
    
    enum PresentationMode {
        case preview
        
        var cellIdentifier: String {
            switch self {
            case .preview:
                return DashboardImagePreviewCollectionViewCell.dequeuIdentifier
            }
        }
    }
    
}

