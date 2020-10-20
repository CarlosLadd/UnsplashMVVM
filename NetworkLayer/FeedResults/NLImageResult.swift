//
//  NLImageResult.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

struct NLImageResult: Decodable {
    
    let results: [NLImage]
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        
        results = try container.decode([NLImage].self)
    }
    
}
