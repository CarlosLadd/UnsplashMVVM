//
//  DataSourceAssembly.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation
import Swinject

final class DataSourceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(PLRemoteDataSourceProtocol.self) { _ in
            return NLRemoteDataSource()
        }
    }
    
}
