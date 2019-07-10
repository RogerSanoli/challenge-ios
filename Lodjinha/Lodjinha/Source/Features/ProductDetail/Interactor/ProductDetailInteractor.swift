//
//  ProductDetailInteractor.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit
import RogueKit

class ProductDetailInteractor: DKInteractor {
    fileprivate var presenter: ProductDetailPresenterProtocol? { return self.getAbstractPresenter() as? ProductDetailPresenterProtocol }
}

extension ProductDetailInteractor: ProductDetailInteractorProtocol {
    
    func loadProduct(productID: Int) {
        RogueKit.request(ProductRepository.productDetail(productID: productID)) { [weak self] (result: Result<ProductEntity, Error>) in
            switch result {
            case let .success(product):
                self?.presenter?.processProduct(product)
            case let .failure(error):
                self?.presenter?.requestFailed(error)
            }
        }
    }
    
    func reserveProduct(productID: Int) {
        
        self.presenter?.lockReservation()
        
        RogueKit.request(ProductRepository.reserveProduct(productID: productID)) { [weak self] (result: Result<ReservationEntity, Error>) in
            switch result {
            case .success(_):
                self?.presenter?.processProductReserved()
            case let .failure(error):
                self?.presenter?.requestFailed(error)
            }
        }
    }
}
