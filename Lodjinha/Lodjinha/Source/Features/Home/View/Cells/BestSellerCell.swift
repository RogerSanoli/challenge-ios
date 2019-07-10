//
//  BestSellerCell.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import UIKit
import PaladinKit

class BestSellerCell: UITableViewCell {
    
    @IBOutlet weak private var categoryLabel: UILabel!
    @IBOutlet weak private var categoryLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak private var categoryLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var imageImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var priceFromLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    
    public func setup(_ viewModel: BestSellerViewModel) {
        self.categoryLabel.isHidden = !viewModel.categoryVisible
        self.categoryLabelTopConstraint.constant = viewModel.categoryVisible ? 10 : 0
        self.categoryLabelHeightConstraint.constant = viewModel.categoryVisible ? 18 : 0
        
        self.imageImageView.download(viewModel.imageURL, errorImage: "download_error")
        self.titleLabel.text = viewModel.title
        self.priceFromLabel.attributedText = viewModel.priceFrom
        self.priceLabel.text = viewModel.price
    }
}
