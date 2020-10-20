//
//  PLRemoteDataSourceProtocol.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

public protocol PLRemoteDataSourceProtocol {
    
    func imagesDataSource() -> PLImageRemoteDataSourceProtocol
    
}
