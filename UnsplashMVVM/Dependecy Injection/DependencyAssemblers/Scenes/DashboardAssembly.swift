//
//  DashboardAssembly.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation
import Swinject

final class DashboardAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(DashboardInteractorProtocol.self) { resolver in
            let useCaseProvider = resolver.resolve(DLUseCaseProviderProtocol.self)
            return DashboardInteractor(useCaseProvider: useCaseProvider!)
        }
        
        container.register(DashboardViewModelProtocol.self) { resolver in
            let interactor = resolver.resolve(DashboardInteractorProtocol.self)
            return DashboardViewModel(interactor: interactor!)
        }
    }
    
}
