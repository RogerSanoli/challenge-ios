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

class ProductDetailCell: UITableViewCell {
    
    @IBOutlet weak private var imageImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var priceFromLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    @IBOutlet weak private var subtitleLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    public func setup(_ viewModel: ProductDetailViewModel) {
        self.imageImageView.download(viewModel.imageURL, errorImage: "download_error")
        self.titleLabel.text = viewModel.title
        self.priceFromLabel.attributedText = viewModel.priceFrom
        self.priceLabel.text = viewModel.price
        self.subtitleLabel.text = viewModel.subtitle
        self.descriptionLabel.attributedText = viewModel.description
    }
}
