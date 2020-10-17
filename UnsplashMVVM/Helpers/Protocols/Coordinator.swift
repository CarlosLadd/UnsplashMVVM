//
//  Coordinator.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    
    var childCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func childDidFinish(_ child: Coordinator)
    
}

// MARK: - Coordinator Pattern

extension Coordinator {
    
    var unwrappedParentCoordinator: Coordinator {
        return parentCoordinator ?? self
    }
    
    func childDidFinish(_ child: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: index)
            break
        }
    }
    
    func childDidFinish() {
        childCoordinators.removeLast()
    }
    
}
