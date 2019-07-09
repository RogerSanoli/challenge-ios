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
    bestSellerList
    
    public var domain: String { return "https://alodjinha.herokuapp.com" }
    
    public func createRequest() throws -> RKRequest {
        switch self {
        case .bannerList:
            return RKRequest.get("/banner")
        case .categoryList:
            return RKRequest.get("/categoria")
        case .bestSellerList:
            return RKRequest.get("/produto/maisvendidos")
        }
    }
}
