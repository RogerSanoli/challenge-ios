//
//  ProductDetailSceneFactory.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

class ProductDetailSceneFactory: DKAbstractSceneFactory {
    
    required init() {}
    
    func generateInteractor() -> DKAbstractInteractor {
        return ProductDetailInteractor()
    }
    
    func generatePresenter() -> DKAbstractPresenter {
        return ProductDetailPresenter()
    }
}
