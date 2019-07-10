//
//  CategoryListViewControllerProtocol.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

protocol CategoryListViewControllerProtocol: DKAbstractView {
    func alertError(_ message: String)
    func presentProductList(_ viewModelList: [ProductViewModel], hasMore: Bool)
}
