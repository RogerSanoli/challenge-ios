//
//  CategoryListCellViewModel.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 08/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation

public struct CategoryListViewModel {
    
    var isLoading: Bool
    var categoryList: [CategoryViewModel]
    
    init(_ entity: ListEntity<CategoryEntity>?) {
        isLoading = entity == nil
        categoryList = []
        
        guard let categoryEntityList = entity?.data else { return }
        for categoryEntity in categoryEntityList {
            if categoryEntity.id != nil {
                categoryList.append(CategoryViewModel(categoryEntity))
            }
        }
    }
}
