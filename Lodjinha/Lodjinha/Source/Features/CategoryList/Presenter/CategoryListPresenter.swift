//
//  CategoryListPresenter.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

class CategoryListPresenter: DKPresenter {
    fileprivate var view: CategoryListViewControllerProtocol? { return self.getAbstractView() as? CategoryListViewControllerProtocol }
    fileprivate var productViewModels: [ProductViewModel] = []
}

extension CategoryListPresenter: CategoryListPresenterProtocol {
    func requestFailed(_ error: Error) {
        sync {
            self.view?.alertError(error.localizedDescription)
        }
    }
    
    func processProducts(_ productList: ListEntity<ProductEntity>, hasMore: Bool) {
        
        guard let entityList = productList.data else { return }
        
        for entity in entityList {
            productViewModels.append(ProductViewModel(entity))
        }
        
        sync {
            self.view?.presentProductList(productViewModels, hasMore: hasMore)
        }
    }
}
