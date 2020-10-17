//
//  MainTabBarBuilder.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

final class MainTabBarBuilder {
    
    class func buildViewCoordinators() -> [Coordinator] {
        
        let dashboardNavigationController = createNavigationController(
            title: "Dashboard",
            image: #imageLiteral(resourceName: "icon-dashboard"))
        let dashboardCoordinator = DashboardCoordinator(navigationController: dashboardNavigationController)
        
        dashboardCoordinator.start()
        
        return [
            dashboardCoordinator
        ]
        
    }
    
    // MARK: - Making UINavigationController
    
    class func createNavigationController(title: String, image: UIImage) -> UINavigationController {
        let navController = UINavigationController()
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.setNavigationBarHidden(true, animated: false)
        
        return navController
    }
    
}
