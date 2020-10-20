//
//  NLImage.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/20/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

public struct NLImage: Decodable {
    
    public let id: String
    public let created_at: String
    public let alt_description: String
    public let urls: NLUrls
    public let likes: Int
    // public let user: NLUser
    
    private enum CodingKeys: String, CodingKey {
        case id, created_at, alt_description, urls, likes
    }
    
    init(id: String,
         created_at: String,
         alt_description: String,
         urls: NLUrls,
         likes: Int) {
        self.id = id
        self.created_at = created_at
        self.alt_description = alt_description
        self.urls = urls
        self.likes = likes
        // self.user = user
    }
    
}

extension NLImage: DomainConvertible {
    
    func asDomain() -> DLImage {
        
        return DLImage(id: id,
                       created_at: created_at,
                       alt_description: alt_description,
                       urls: urls.asDomain(),
                       likes: likes,
                       user: DLUser(id: "", username: "", name: "", bio: "", twitter_username: "", profile_image: nil, instagram_username: "", total_likes: 0, total_photos: 0))
    }
    
}
