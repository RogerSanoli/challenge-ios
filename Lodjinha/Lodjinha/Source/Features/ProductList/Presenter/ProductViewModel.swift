//
//  ProductViewModel.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import UIKit
import PaladinKit

public struct ProductViewModel {
    
    var productID: Int
    var imageURL: String
    var title: String
    var priceFrom: NSAttributedString
    var price: String
    
    init(_ entity: ProductEntity) {
        self.productID = entity.id ?? 0
        self.imageURL = entity.urlImagem ?? ""
        self.title = "\(entity.nome ?? "") - \(entity.descricao ?? "")"
        self.priceFrom = String(format: "De: %.2f", entity.precoDe ?? 0).replacingOccurrences(of: ".", with: ",").strikeThrough()
        self.price = String(format: "Por: %.2f", entity.precoPor ?? 0).replacingOccurrences(of: ".", with: ",")
    }
}
