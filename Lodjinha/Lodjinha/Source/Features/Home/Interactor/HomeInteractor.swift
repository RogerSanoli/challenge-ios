//
//  HomeInteractor.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 07/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit
import RogueKit

class HomeInteractor: DKInteractor {
    fileprivate var presenter: HomePresenterProtocol? { return self.getAbstractPresenter() as? HomePresenterProtocol }
}

extension HomeInteractor: HomeInteractorProtocol {
    func loadBanners() {
        RogueKit.request(ProductRepository.bannerList) { [weak self] (result: ListResult<BannerEntity>) in
            switch result {
            case let .success(bannerList):
                self?.presenter?.processBanners(bannerList)
            case let .failure(error):
                self?.presenter?.requestFailed(error)
            }
        }
    }
    
    func loadCategories() {
        
    }
    
    func loadBestSellers() {
        
    }
}
