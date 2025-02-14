//
//  Item.swift
//  Ledger
//
//  Created by Yumin Xia on 2025/2/13.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
