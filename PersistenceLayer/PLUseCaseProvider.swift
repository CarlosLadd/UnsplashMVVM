//
//  PLUseCaseProvider.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

public class PLUseCaseProvider: DLUseCaseProviderProtocol {
    
    private let remoteDataSource: PLRemoteDataSourceProtocol
    
    // MARK: - Initializers
    
    init(remoteDataSource: PLRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    // MARK: - Use Cases
    
    public func imageUseCase() -> DLImageUseCaseProtocol {
        let remoteDataSource = self.remoteDataSource.imagesDataSource()
        return PLImageRepository(remoteDataSource: remoteDataSource)
    }
    
}
