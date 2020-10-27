//
//  DashboardViewController.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, Storyboarded {
    
    // Storyboard
    static var storyboardName: String = "Dashboard"
    
    // Constants
    let previewCellHeight: Double = 150.0
    let imageAspectRatio: Double = 1.5
    
    // ViewModel
    var viewModel: DashboardViewModelProtocol!
    
    // Coordinator
    weak var coordinator: DashboardCoordinatorProtocol?

    // Images CollectionView
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    private var dataSource: SimpleCollectionViewDataSource<DashboardCellViewModelProtocol>!
    private var prefetchDataSource: CollectionViewDataSourcePrefetching!
    private var displayedCellsIndexPaths = Set<IndexPath>()
    
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
        imagesCollectionView.delegate = self
        imagesCollectionView.registerNib(cellType: DashboardImagePreviewCollectionViewCell.self)
        
        let previewLayoutWidth = previewCellHeight / imageAspectRatio
        let previewLayout = VerticalFlowLayout(width: previewLayoutWidth, height: previewCellHeight)
        previewLayout.scrollDirection = .vertical
        
        imagesCollectionView.collectionViewLayout = previewLayout
    }
    
    private func reloadCollectionView() {
        print(#function)
        
        guard let viewModel = viewModel else { return }
        dataSource = SimpleCollectionViewDataSource.make(for: viewModel.imageCells,
                                                         presentationMode: presentationMode)
        
        prefetchDataSource = CollectionViewDataSourcePrefetching(
            cellCount: viewModel.imageCells.count,
            needsPrefetch: viewModel.needsPrefetch,
            prefetchHandler: { [weak self] in
                self?.viewModel.getImages()
        })
        
        imagesCollectionView.dataSource = dataSource
        imagesCollectionView.prefetchDataSource = prefetchDataSource
        
        imagesCollectionView.reloadData()
    }
    
    // MARK: - Current State of the view
    
    private func configureView(withState  state: ListViewState<DLImage>) {
        let backgroundView = UIView(frame: self.view.bounds)
        
        switch state {
        case .populated, .paging, .initial:
            backgroundView.backgroundColor = .clear
            imagesCollectionView.backgroundView = backgroundView
        case .empty:
            backgroundView.backgroundColor = .darkGray
            imagesCollectionView.backgroundView = UIView(frame: .zero)
        case .error:
            backgroundView.backgroundColor = .black
            imagesCollectionView.backgroundView = UIView(frame: .zero)
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
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        if !displayedCellsIndexPaths.contains(indexPath) {
            displayedCellsIndexPaths.insert(indexPath)
            CollectionViewCellAnimator.fadeAnimate(cell: cell)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
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

