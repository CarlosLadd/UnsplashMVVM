//
//  NLProfileImage.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/20/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

public struct NLProfileImage: Decodable {
    
    public let small: String
    public let medium: String
    public let large: String
    
    private enum CodingKeys: String, CodingKey {
        case small, medium, large
    }
    
    init(small: String,
         medium: String,
         large: String) {
        self.small = small
        self.medium = medium
        self.large = large
    }
    
}

extension NLProfileImage: DomainConvertible {
    
    func asDomain() -> DLProfileImage {
        
        return DLProfileImage(small: small,
                              medium: medium,
                              large: large)
    }
    
}
