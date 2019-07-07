//
//  HomePresenter.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 06/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

class HomePresenter: DKPresenter {
    fileprivate var view: HomeViewControllerProtocol? { return self._view as? HomeViewControllerProtocol }
}

extension HomePresenter: HomePresenterProtocol {

}
