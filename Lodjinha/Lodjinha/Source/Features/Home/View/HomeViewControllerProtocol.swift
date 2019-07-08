//
//  HomeViewControllerProtocol.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 07/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

protocol HomeViewControllerProtocol: DKAbstractView {
    func alertError(_ message: String)
    func presentBanner(_ viewModel: BannerViewModel)
}
