//
//  CategoryListSceneFactory.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

class ProductListSceneFactory: DKAbstractSceneFactory {
    
    required init() {}
    
    func generateInteractor() -> DKAbstractInteractor {
        return ProductListInteractor()
    }
    
    func generatePresenter() -> DKAbstractPresenter {
        return ProductListPresenter()
    }
}
