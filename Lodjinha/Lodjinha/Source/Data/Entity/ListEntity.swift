//
//  ListEntity.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 06/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import RogueKit

public struct ListEntity<T: Entity>: Entity {
    var data: [T]?
    var offset: Int?
    var total: Int?
    
    init(offset: Int, total: Int) {
        self.offset = offset
        self.total = total
    }
}
