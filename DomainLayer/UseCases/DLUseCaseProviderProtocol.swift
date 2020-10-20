//
//  DLUseCaseProviderProtocol.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import Foundation

public protocol DLUseCaseProviderProtocol {
    
    func imageUseCase() -> DLImageUseCaseProtocol
    
}
