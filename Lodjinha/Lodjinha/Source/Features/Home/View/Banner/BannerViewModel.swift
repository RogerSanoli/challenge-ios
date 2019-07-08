//
//  BannerViewModel.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 08/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import RogueKit

public struct BannerViewModel {
    
    var isLoading: Bool
    var urlList: [String]
    
    init(_ entity: ListEntity<BannerEntity>?) {
        isLoading = entity == nil
        urlList = []
        
        guard let bannerEntityList = entity?.data else { return }
        for bannerEntity in bannerEntityList {
            if let url = bannerEntity.urlImagem {
                urlList.append(url)
            }
        }
    }
}
