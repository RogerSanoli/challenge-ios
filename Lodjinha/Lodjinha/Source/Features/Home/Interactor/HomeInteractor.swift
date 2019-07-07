//
//  HomeInteractor.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 06/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

class HomeInteractor: DKInteractor {
    fileprivate var presenter: HomePresenterProtocol? { return self.getAbstractPresenter() as? HomePresenterProtocol }
}

extension HomeInteractor: HomeInteractorProtocol {

}
