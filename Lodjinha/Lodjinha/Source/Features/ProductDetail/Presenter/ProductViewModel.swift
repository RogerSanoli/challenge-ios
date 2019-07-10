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
    var subtitle: String
    var description: NSAttributedString
    var categoryTitle: String
    
    init(_ entity: ProductEntity) {
        self.productID = entity.id ?? 0
        self.imageURL = entity.urlImagem ?? ""
        self.title = entity.nome ?? ""
        self.priceFrom = String(format: "De: %.2f", entity.precoDe ?? 0).replacingOccurrences(of: ".", with: ",").strikeThrough()
        self.price = String(format: "Por: %.2f", entity.precoPor ?? 0).replacingOccurrences(of: ".", with: ",")
        self.subtitle = entity.nome ?? ""
        self.categoryTitle = entity.categoria?.descricao ?? ""
        
        let html: NSMutableAttributedString = (entity.descricao ?? "").html()
        let textAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)] as [NSAttributedString.Key: Any]
        html.addAttributes(textAttributes, range: NSRange(location: 0, length: html.length))
        self.description = html
    }
}
