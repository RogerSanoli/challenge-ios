//
//  ProductDetailPresenter.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

class ProductDetailPresenter: DKPresenter {
    fileprivate var view: ProductDetailViewControllerProtocol? { return self.getAbstractView() as? ProductDetailViewControllerProtocol }
}

extension ProductDetailPresenter: ProductDetailPresenterProtocol {
    func requestFailed(_ error: Error) {
        sync {
            self.view?.alertError(error.localizedDescription)
        }
    }
    
    func processProduct(_ product: ProductEntity) {
        let viewModel = ProductViewModel(product)
        sync {
            self.view?.presentProduct(viewModel)
        }
    }
    
    func lockReservation() {
        sync {
            self.view?.lockReserveButton()
        }
    }
    
    func processProductReserved() {
        sync {
            self.view?.alertProductReserved()
        }
    }
}
