//
//  CategoryCell.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 08/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak private var categoryImage: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    
    private(set) var categoryID: Int = 0
    
    public func setup(_ viewModel: CategoryViewModel) {
        self.categoryImage.download(viewModel.imageUrl)
        self.titleLabel.text = viewModel.title
        self.categoryID = viewModel.categoryID
    }
}
