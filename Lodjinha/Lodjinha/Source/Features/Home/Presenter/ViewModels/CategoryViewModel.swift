//
//  CategoryViewModel.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 08/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation

public struct CategoryViewModel {
    var title: String
    var imageUrl: String
    var categoryID: Int
    
    init(_ entity: CategoryEntity) {
        self.title = entity.descricao ?? ""
        self.imageUrl = entity.urlImagem ?? ""
        self.categoryID = entity.id ?? 0
    }
}
