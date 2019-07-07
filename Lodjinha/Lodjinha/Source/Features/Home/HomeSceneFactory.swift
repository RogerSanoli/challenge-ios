//
//  HomeSceneFactory.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 06/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

class HomeSceneFactory: DKAbstractSceneFactory {
    
    required init() {}
    
    func generateInteractor() -> DKAbstractInteractor {
        return HomeInteractor()
    }
    
    func generatePresenter() -> DKAbstractPresenter {
        return HomePresenter()
    }
}
