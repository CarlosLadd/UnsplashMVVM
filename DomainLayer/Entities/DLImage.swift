//
//  DLImage.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

public struct DLImage: Equatable {
    
    public let id: String
    public let created_at: String
    public let alt_description: String
    public let urls: DLUrls
    public let likes: Int
    public let user: DLUser
    
}
