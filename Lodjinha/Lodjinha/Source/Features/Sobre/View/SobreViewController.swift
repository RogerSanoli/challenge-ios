//
//  SobreViewController.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

class SobreViewController: DKViewController<SobreSceneFactory> {
    
    @IBOutlet weak private var iconImage: UIImageView!
    @IBOutlet weak private var logoLabel: UILabel!
    @IBOutlet weak private var developerLabelContainer: UIView!
    
    fileprivate var interactor: SobreInteractorProtocol? { return self.getAbstractInteractor() as? SobreInteractorProtocol }
    
    /*
        Calling super.viewDidLoad() is mandatory in order to setup the VIP cycle.
    */
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        iconImage.alpha = 0
        logoLabel.alpha = 0
        developerLabelContainer.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.2, options: .curveEaseInOut, animations: { self.iconImage.alpha = 1 })
        UIView.animate(withDuration: 0.3, delay: 0.4, options: .curveEaseInOut, animations: { self.logoLabel.alpha = 1 })
        UIView.animate(withDuration: 0.3, delay: 0.6, options: .curveEaseInOut, animations: { self.developerLabelContainer.alpha = 1 })
    }
}

extension SobreViewController: SobreViewControllerProtocol {

}
