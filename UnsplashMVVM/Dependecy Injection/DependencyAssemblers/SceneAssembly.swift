//
//  SceneAssembly.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation
import Swinject

class SceneAssembly: Assembly {
    
    func assemble(container: Container) {
        let assemblies: [Assembly] = [
            DashboardAssembly(),
            ProfileAssembly()
        ]
        
        assemblies.forEach { $0.assemble(container: container) }
    }
    
}
