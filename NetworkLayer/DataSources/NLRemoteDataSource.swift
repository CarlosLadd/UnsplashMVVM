//
//  NLRemoteDataSource.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

final public class NLRemoteDataSource: PLRemoteDataSourceProtocol {
    
    public init() {}
    
    public func imagesDataSource() -> PLImageRemoteDataSourceProtocol {
        let client = NLImageClient()
        return NLImageRemoteDataSource(client: client)
    }
    
}
