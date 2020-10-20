//
//  ProviderAssembly.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation
import Swinject

final class ProviderAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(DLUseCaseProviderProtocol.self) { resolver in
            PLUseCaseProvider(remoteDataSource: resolver.resolve(PLRemoteDataSourceProtocol.self)!)
        }
    }
    
}
