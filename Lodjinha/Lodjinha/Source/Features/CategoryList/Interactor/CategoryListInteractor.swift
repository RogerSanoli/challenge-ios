//
//  CategoryListInteractor.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit
import RogueKit

class CategoryListInteractor: DKInteractor {
    fileprivate var presenter: CategoryListPresenterProtocol? { return self.getAbstractPresenter() as? CategoryListPresenterProtocol }
    fileprivate var offset = 0
    fileprivate let pageSize = 20
}

extension CategoryListInteractor: CategoryListInteractorProtocol {
    func loadNextPage(_ categoryID: Int) {
        RogueKit.request(ProductRepository.productList(offset: self.offset, limit: self.offset + self.pageSize, categoriaId: categoryID)) { [weak self] (result: ListResult<ProductEntity>) in
            switch result {
            case let .success(productList):
                self?.offset += (self?.pageSize ?? 0)
                let hasMore = ((self?.offset ?? 0) < (productList.total ?? 0)) && ((productList.data?.count ?? 0) == (self?.pageSize ?? 0))
                self?.presenter?.processProducts(productList, hasMore: hasMore)
            case let .failure(error):
                self?.presenter?.requestFailed(error)
            }
        }
    }
}
