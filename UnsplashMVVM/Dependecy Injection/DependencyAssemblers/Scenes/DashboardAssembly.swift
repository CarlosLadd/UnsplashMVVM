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
        container.register(DashboardViewModelProtocol.self) { resolver in
            return DashboardViewModel()
        }
    }
    
}
