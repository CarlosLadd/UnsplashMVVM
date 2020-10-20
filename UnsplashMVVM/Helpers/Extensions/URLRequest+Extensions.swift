//
//  URLRequest+Extensions.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

extension URLRequest {
    
    mutating func setJSONContentType() {
        setValue("application/json",
                 forHTTPHeaderField: "Content-Type")
    }
    
    mutating func setHeader(for httpHeaderField: String, with value: String) {
        setValue(value, forHTTPHeaderField: httpHeaderField)
    }
    
}
