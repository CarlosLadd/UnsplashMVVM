//
//  NLImageClient.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

class NLImageClient: NLAPIClient {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
           self.init(configuration: .default)
    }
    
    // MARK: - Images
    
    func getImages(page: Int,
                   completion: @escaping (Result<[NLImage]?, NLAPIError>) -> Void) {
        let request = NLImageProvider.getImages(page: page).request
        
        fetch(with: request, decode: { json -> [NLImage]?? in
            guard let imageResult = json as? [NLImage] else { return nil }
            return imageResult
            
        }, completion: completion)
    }
    
}
