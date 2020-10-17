//
//  NavigationHandler.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

final class NavigationHandler: NavigationHandlerProtocol {
    
    func initialTransition(from window: UIWindow?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarController: UITabBarController = storyboard.instantiateInitialViewController() as! UITabBarController
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
}
