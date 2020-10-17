//
//  ProfileViewModel.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

final class ProfileViewModel: ProfileViewModelProtocol {
    
    // MARK: Initializers
    
    init() {
        print("ProfileViewModel Init")
    }
    
    // MARK: - Actionable
    
    func getProfileData() {
        print("Obtener información del perfil")
    }
    
}
