//
//  DashboardCoordinator.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

final class DashboardCoordinator: NSObject, DashboardCoordinatorProtocol, Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator Delegate
    
    func start() {
        let viewcontroller = DashboardViewController.instantiate()
        
        viewcontroller.viewModel = DIContainer.shared.resolve()
        viewcontroller.coordinator = self
        
        setupNavigationDelegate()
        navigationController.pushViewController(viewcontroller, animated: true)
    }
    
    // MARK: - DashboardProtocol Delegate
    
    func showImageDetail() {
        // Code
    }
    
    // MARK: - Navigation Configuration
    
    private func setupNavigationDelegate() {
        // Code
    }
    
}
