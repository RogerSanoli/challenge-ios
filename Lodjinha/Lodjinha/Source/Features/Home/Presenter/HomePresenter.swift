//
//  HomePresenter.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 07/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

class HomePresenter: DKPresenter {
    fileprivate weak var view: HomeViewControllerProtocol? { return self.getAbstractView() as? HomeViewControllerProtocol }
}

extension HomePresenter: HomePresenterProtocol {
    
    func requestFailed(_ error: Error) {
        sync {
            self.view?.alertError(error.localizedDescription)
        }
    }
    
    func processBanners(_ bannerList: ListEntity<BannerEntity>) {
        let viewModel = BannerViewModel(bannerList)
        sync {
            self.view?.presentBanner(viewModel)
        }
    }
    
    func processCategories(_ categoryList: ListEntity<CategoryEntity>) {
        let viewModel = CategoryListViewModel(categoryList)
        sync {
            self.view?.presentCategoryList(viewModel)
        }
    }
    
    func processBestSellers(_ bestSellerList: ListEntity<ProductEntity>) {
        
        guard let entityList = bestSellerList.data else { return }
        
        var viewModels: [BestSellerViewModel] = []
        
        for (index, entity) in entityList.enumerated() {
            if entity.id != nil {
                viewModels.append(BestSellerViewModel(entity, categoryVisible: index == 0))
            }
        }
        
        sync {
            self.view?.presentBestSellers(viewModels)
        }
    }
}
