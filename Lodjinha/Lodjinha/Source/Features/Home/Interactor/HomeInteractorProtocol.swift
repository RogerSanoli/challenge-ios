//
//  HomeInteractorProtocol.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 07/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

protocol HomeInteractorProtocol: DKAbstractInteractor {
    func loadBanners()
    func loadCategories()
    func loadBestSellers()
}
