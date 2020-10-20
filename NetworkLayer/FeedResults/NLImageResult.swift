//
//  NLImageResult.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

struct NLImageResult: Decodable {
    
    let results: [Int]
    
    private enum CodingKeys: String, CodingKey {
        case results
    }
    
}
