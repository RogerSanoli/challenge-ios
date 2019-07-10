//
//  BestSellerViewModel.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import UIKit
import PaladinKit

public struct BestSellerViewModel {
    
    var productID: Int
    var categoryVisible: Bool
    var imageURL: String
    var title: String
    var priceFrom: NSAttributedString
    var price: String
    
    init(_ entity: ProductEntity, categoryVisible: Bool) {
        self.productID = entity.id ?? 0
        self.categoryVisible = categoryVisible
        self.imageURL = entity.urlImagem ?? ""
        self.title = "\(entity.nome ?? "") - \(entity.descricao ?? "")"
        self.priceFrom = String(format: "De: %.2f", entity.precoDe ?? 0).replacingOccurrences(of: ".", with: ",").strikeThrough()
        self.price = String(format: "Por: %.2f", entity.precoPor ?? 0).replacingOccurrences(of: ".", with: ",")
    }
}
