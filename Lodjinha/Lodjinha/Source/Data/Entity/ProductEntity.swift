//
//  ProductEntity.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 06/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import RogueKit

public struct ProductEntity: Entity {
    var id: Int?
    var nome: String?
    var descricao: String?
    var urlImagem: String?
    var precoDe: Double?
    var precoPor: Double?
    var categoria: CategoryEntity?
}
