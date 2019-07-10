//
//  SobrePresenter.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

class SobrePresenter: DKPresenter {
    fileprivate var view: SobreViewControllerProtocol? { return self.getAbstractView() as? SobreViewControllerProtocol }
}

extension SobrePresenter: SobrePresenterProtocol {

}
