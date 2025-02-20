//
//  Log.swift
//  Ledger
//
//  Created by Yumin Xia on 2025/2/13.
//

import Foundation
import SwiftData

@Model
class Log: Identifiable {
    var id: String
    var date: Date
    var ledgerId: String
    var picSource: Data?
    var amount: Int

    init(date: Date = .now, ledgerId: String = "", picSource: Data? = nil, amount: Int = 0) {
        self.id = UUID().uuidString
        self.date = date
        self.ledgerId = ledgerId
        self.picSource = picSource
        self.amount = amount
    }
}
