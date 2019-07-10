//
//  ViewController.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 05/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import UIKit
import WizardKit

class ViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.perform(#selector(presentHome), with: nil, afterDelay: 2)
    }
    
    @objc func presentHome() {
        self.performSegue(withIdentifier: "lodjinha", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "lodjinha" {
            let bounds = CGRect.windowBounds()
            segue.destination.setAnimation(.hole(x: bounds.midX, y: bounds.midY, size: 0))
        }
    }
}

