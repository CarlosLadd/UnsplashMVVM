//
//  NLImageProvider.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

enum NLImageProvider {
    case getImages(page: Int)
}

// MARK: - Endpoint

extension NLImageProvider: NLEndpoint {
    
    var base: String {
        return "https://api.unsplash.com"
    }
    
    var path: String {
        switch self {
        case .getImages:
            return "/photos"
        }
    }
    
    var headers: [String: String]? {
           return nil
    }
    
    var params: [String: Any]? {
        switch self {
        case .getImages(let page):
            return ["page": page,
                    "per_page": 20]
        }
    }
    
    var parameterEncoding: ParameterEnconding {
        return .defaultEncoding
    }
    
    var method: HTTPMethod {
        return .get
    }
    
}
