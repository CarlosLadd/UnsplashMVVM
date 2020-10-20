//
//  NLImageRemoteDataSource.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

final class NLImageRemoteDataSource: PLImageRemoteDataSourceProtocol {
    
    private let client: NLImageClient
    
    init(client: NLImageClient) {
        self.client = client
    }
    
    func getImages(page: Int, completion: @escaping (Result<[DLImage], Error>) -> Void) {
        client.getImages(page: page, completion: { result in
            switch result {
            case .success(let images):
                guard let imagesResult = images else { return }
                let images = imagesResult.map { $0.asDomain() }
                completion(.success(images))
                
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
}
