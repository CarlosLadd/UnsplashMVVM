//
//  ProfileCoordinator.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

final class ProfileCoordinator: NSObject, Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator Delegate
    
    func start() {
        let viewcontroller = ProfileViewController()
        
        viewcontroller.viewModel = DIContainer.shared.resolve()
        
        navigationController.pushViewController(viewcontroller, animated: true)
    }
    
}
