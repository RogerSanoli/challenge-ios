//
//  SobreInteractor.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

class SobreInteractor: DKInteractor {
    fileprivate var presenter: SobrePresenterProtocol? { return self.getAbstractPresenter() as? SobrePresenterProtocol }
}

extension SobreInteractor: SobreInteractorProtocol {

}
