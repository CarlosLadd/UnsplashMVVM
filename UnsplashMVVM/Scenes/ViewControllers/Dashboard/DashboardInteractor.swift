//
//  DashboardInteractor.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

struct DashboardInteractor: DashboardInteractorProtocol {
    
    private let imageUseCase: DLImageUseCaseProtocol
    
    // MARK: - Initializers
    
    init(useCaseProvider: DLUseCaseProviderProtocol) {
        self.imageUseCase = useCaseProvider.imageUseCase()
    }
    
    // MARK: - Actions
    
    func getImages(page: Int, completion: @escaping (Result<[DLImage], Error>) -> Void) {
        self.imageUseCase.getImages(page: page,
                                    completion: completion)
    }
    
}
