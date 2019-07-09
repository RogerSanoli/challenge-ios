//
//  HomePresenterProtocol.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 07/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

protocol HomePresenterProtocol: DKAbstractPresenter {
    func requestFailed(_ error: Error)
    func processBanners(_ bannerList: ListEntity<BannerEntity>)
    func processCategories(_ categoryList: ListEntity<CategoryEntity>)
}
