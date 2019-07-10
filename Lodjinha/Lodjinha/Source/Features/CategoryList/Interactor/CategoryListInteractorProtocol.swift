//
//  CategoryListInteractorProtocol.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

protocol CategoryListInteractorProtocol: DKAbstractInteractor {
    func loadNextPage(_ categoryID: Int)
}
