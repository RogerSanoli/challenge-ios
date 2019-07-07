//
//  HomeViewController.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 06/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

class HomeViewController: DKViewController<HomeSceneFactory> {
    
    fileprivate var interactor: HomeInteractorProtocol? { return self.getAbstractInteractor() as? HomeInteractorProtocol }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Your code here...
    }
    
}

extension HomeViewController: HomeViewControllerProtocol {

}
