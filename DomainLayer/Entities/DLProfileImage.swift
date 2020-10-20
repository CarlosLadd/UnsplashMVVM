//
//  DLProfileImage.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

public struct DLProfileImage: Equatable {
    
    public let small: String
    public let medium: String
    public let large: String
    
    public init(small: String,
                medium: String,
                large: String) {
        self.small = small
        self.medium = medium
        self.large = large
    }
    
}
