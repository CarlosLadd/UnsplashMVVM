//
//  NLUrls.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/20/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

public struct NLUrls: Decodable {
    
    public let raw: String
    public let full: String
    public let regular: String
    public let small: String
    public let thumb: String
    
    private enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
    }
    
    init(raw: String,
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

extension NLUrls: DomainConvertible {
    
    func asDomain() -> DLUrls {
        return DLUrls(raw: raw,
                      full: full,
                      regular: regular,
                      small: small,
                      thumb: thumb)
    }
    
}
