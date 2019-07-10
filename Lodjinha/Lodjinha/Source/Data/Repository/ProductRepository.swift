//
//  ProductRepository.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 06/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import RogueKit

public enum ProductRepository: RKRepository {
    case bannerList,
    categoryList,
    bestSellerList,
    productDetail(productID: Int),
    reserveProduct(productID: Int),
    productList(offset: Int, limit: Int, categoriaId: Int)
    
    public var domain: String { return "https://alodjinha.herokuapp.com" }
    
    public func createRequest() throws -> RKRequest {
        switch self {
        case .bannerList:
            return RKRequest.get("/banner")
        case .categoryList:
            return RKRequest.get("/categoria")
        case .bestSellerList:
            return RKRequest.get("/produto/maisvendidos")
        case let .productDetail(productID):
            return RKRequest.get("/produto/\(productID)")
        case let .reserveProduct(productID):
            return RKRequest.post("/produto/\(productID)")
        case let .productList(offset, limit, categoriaId):
            return RKRequest.get("/produto?offset=\(offset)&limit=\(limit)&categoriaId=\(categoriaId)")
        }
    }
}
