//
//  DashboardViewController.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    // ViewModel
    var viewModel: DashboardViewModelProtocol!
    
    // Coordinator
    weak var coordinator: DashboardCoordinatorProtocol?

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        viewModel?.getImages()
        viewModel?.refreshImages()
    }

}

