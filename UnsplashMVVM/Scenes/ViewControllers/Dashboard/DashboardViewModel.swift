//
//  DashboardViewModel.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

final class DashboardViewModel: DashboardViewModelProtocol {
    
    // MARK: Properties
    
    private let interactor: DashboardInteractorProtocol
    var viewState: Bindable<ListViewState<DLImage>> = Bindable(.initial)
    var startLoading: Bindable<Bool> = Bindable(false)
    
    // MARK: Computed Properties
    
    var needsPrefetch: Bool {
        return viewState.value.needsPrefetch
    }
    
    private var images: [DLImage] {
        return viewState.value.currentEntities
    }
    
    var imageCells: [DashboardCellViewModelProtocol] {
        print("RENDERING **********")
        return images.compactMap { DashboardCellViewModel($0) }
    }
    
    // MARK: - Initializers
    
    init(interactor: DashboardInteractorProtocol) {
        self.interactor = interactor
    }
    
    // MARK: - Actionable
    
    func getImages() {
        let isLoading = viewState.value.isInitialPage
        fetchImages(currentPage: viewState.value.currentPage, isLoading: isLoading)
    }
    
    func refreshImages() {
        print("Actualizar lista de imagenes")
    }
    
    // MARK: - Private
    
    private func fetchImages(currentPage: Int, isLoading: Bool = false) {
        startLoading.value = isLoading
        
        interactor.getImages(page: currentPage, completion: { result in
            self.startLoading.value = false
            
            switch result {
            case .success(let images):
                self.viewState.value = self.processImagesResult(images,
                                                                currentPage: currentPage,
                                                                currentImages: self.images)
            case .failure(let error):
                self.viewState.value = .error(error)
            }
        })
    }
    
    private func processImagesResult(_ images: [DLImage],
                                     currentPage: Int,
                                     currentImages: [DLImage]) -> ListViewState<DLImage> {
        var allImages = currentPage == 1 ? [] : currentImages
        allImages.append(contentsOf: images)
        
        guard !allImages.isEmpty else { return .empty }
        
        if images.isEmpty {
            return .populated(allImages)
        } else {
            return .paging(allImages, next: currentPage + 1)
        }
    }
    
}
