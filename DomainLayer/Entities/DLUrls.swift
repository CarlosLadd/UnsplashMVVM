//
//  DLUrls.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

public struct DLUrls: Equatable {
    
    public let raw: String
    public let full: String
    public let regular: String
    public let small: String
    public let thumb: String
    
    public init(raw: String,
                full: String,
                regular: String,
                small: String,
                thumb: String) {
        self.raw = raw
        self.full = full
        self.regular = regular
        self.small = small
        self.thumb = thumb
    }
    
}
