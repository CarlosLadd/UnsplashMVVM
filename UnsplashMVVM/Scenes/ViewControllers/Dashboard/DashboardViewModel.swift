//
//  DashboardViewModel.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/16/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

final class DashboardViewModel: DashboardViewModelProtocol {
    
    var startLoading: Bindable<Bool> = Bindable(false)
    
    // MARK: Computed Properties
    
    var needsPrefetch: Bool {
        return false
    }
    
    // MARK: - Initializers
    
    init() {
        print("DashboardViewModel Init")
    }
    
    // MARK: - Actionable
    
    func getImages() {
        print("hacer request para obtener imagenes")
    }
    
    func refreshImages() {
        print("Actualizar lista de imagenes")
    }
    
}
