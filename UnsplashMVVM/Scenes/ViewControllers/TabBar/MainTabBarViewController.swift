//
//  MainTabBarViewController.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    private var currentSelectedItemIndex: Int!
    private var coordinators: [Coordinator]!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        coordinators = MainTabBarBuilder.buildViewCoordinators()
        viewControllers = coordinators.map { $0.navigationController }
    }
    
    // MARK: - Setters
    
    func setSelectedIndex(_ index: Int) {
        selectedIndex = index
        currentSelectedItemIndex = selectedIndex
    }
    
}

// MARK: - UITabBarController Delegate

extension MainTabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Code
    }
    
}
