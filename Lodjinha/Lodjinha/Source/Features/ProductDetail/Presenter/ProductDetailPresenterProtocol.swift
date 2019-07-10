//
//  ProductDetailPresenterProtocol.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

protocol ProductDetailPresenterProtocol: DKAbstractPresenter {
    func requestFailed(_ error: Error)
    func processProduct(_ product: ProductEntity)
    func lockReservation()
    func processProductReserved()
}
