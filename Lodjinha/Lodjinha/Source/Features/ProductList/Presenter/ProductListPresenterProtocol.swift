//
//  CategoryListPresenterProtocol.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

protocol ProductListPresenterProtocol: DKAbstractPresenter {
    func requestFailed(_ error: Error)
    func processProducts(_ productList: ListEntity<ProductEntity>, hasMore: Bool)
}
