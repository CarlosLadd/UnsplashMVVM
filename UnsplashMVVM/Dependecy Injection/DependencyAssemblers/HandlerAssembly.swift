//
//  HandlerAssembly.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation
import Swinject

final class HandlerAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(NavigationHandlerProtocol.self) { _ in
            NavigationHandler()
        }.inObjectScope(.container)
    }
    
}
