//
//  ProfileViewController.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // ViewModel
    var viewModel: ProfileViewModelProtocol!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        viewModel?.getProfileData()
    }
    
}
