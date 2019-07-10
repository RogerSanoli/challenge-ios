//
//  ProductCell.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import UIKit
import PaladinKit

class ProductCell: UITableViewCell {

    @IBOutlet weak private var imageImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var priceFromLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    
    public func setup(_ viewModel: ProductViewModel) {
        self.imageImageView.download(viewModel.imageURL, errorImage: "download_error")
        self.titleLabel.text = viewModel.title
        self.priceFromLabel.attributedText = viewModel.priceFrom
        self.priceLabel.text = viewModel.price
    }
}
