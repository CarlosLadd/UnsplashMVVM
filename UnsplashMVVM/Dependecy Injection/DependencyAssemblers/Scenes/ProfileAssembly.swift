//
//  ProfileAssembly.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation
import Swinject

final class ProfileAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(ProfileViewModelProtocol.self) { resolver in
            return ProfileViewModel()
        }
    }
    
}
