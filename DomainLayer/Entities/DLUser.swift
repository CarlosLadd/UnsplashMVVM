//
//  DLUser.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

public struct DLUser: Equatable {
    
    public let id: String
    public let username: String
    public let name: String
    public let bio: String
    public let twitter_username: String
    public let profile_image: DLProfileImage?
    public let instagram_username: String
    public let total_likes: Int
    public let total_photos: Int
    
    public init(id: String,
                username: String,
                name: String,
                bio: String,
                twitter_username: String,
                profile_image: DLProfileImage?,
                instagram_username: String,
                total_likes: Int,
                total_photos: Int) {
        self.id = id
        self.username = username
        self.name = name
        self.bio = bio
        self.twitter_username = twitter_username
        self.profile_image = profile_image
        self.instagram_username = instagram_username
        self.total_likes = total_likes
        self.total_photos = total_photos
    }
    
}
