//
//  ListEntity.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 06/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import RogueKit

public typealias ListResult<T: Entity> = Result<ListEntity<T>, Error>

public struct ListEntity<T: Entity>: Entity {
    var data: [T]?
    var offset: Int?
    var total: Int?
}
