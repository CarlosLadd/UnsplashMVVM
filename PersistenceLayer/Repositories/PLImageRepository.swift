//
//  PLImageRepository.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

public class PLImageRepository: DLImageUseCaseProtocol {
    
    private var remoteDataSource: PLImageRemoteDataSourceProtocol
    
    // MARK: - Initializers
    
    init(remoteDataSource: PLImageRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    // MARK: - Delegate
    
    public func getImages(page: Int, completion: @escaping (Result<[DLImage], Error>) -> Void) {
        self.remoteDataSource.getImages(page: page,
                                        completion: completion)
    }
    
}
