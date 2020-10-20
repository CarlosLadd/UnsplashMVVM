//
//  CollectionViewDataSourcePrefetching.swift
//  UnsplashMVVM
//
//  Created by Carlos Landaverde on 10/19/20.
//  Copyright © 2020 Carlos Landaverde. All rights reserved.
//

import UIKit

final class CollectionViewDataSourcePrefetching: NSObject, DataSourcePrefetching, UICollectionViewDataSourcePrefetching {
    
    var cellCount: Int
    var needsPrefetch: Bool
    var prefetchHandler: (() -> Void)
    
    init(cellCount: Int, needsPrefetch: Bool, prefetchHandler: @escaping (() -> Void)) {
        self.cellCount = cellCount
        self.needsPrefetch = needsPrefetch
        self.prefetchHandler = prefetchHandler
    }
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        prefetchIfNeeded(for: indexPaths)
    }
    
}
