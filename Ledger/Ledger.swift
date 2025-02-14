//
//  Ledger.swift
//  Ledger
//
//  Created by Yumin Xia on 2025/2/13.
//

import Foundation
import SwiftData

@Model
class Ledger: Identifiable {
    var id: String
    var title: String
    var currency: String
    var currencySymbol: String
    var logs: [Log]
    var totalAmount: Int
    var mode: String
    init(
        title: String = "",
        current: Currency = .cny,
        currencySymbol: String = "",
        logs: [Log] = [],
        totalAmount: Int = 0,
        mode: String = LedgerMode.timeline.rawValue
    ) {
        self.id = UUID().uuidString
        self.title = title
        self.currency = current.rawValue
        self.currencySymbol = currencySymbol
        self.logs = logs
        self.totalAmount = totalAmount
        self.mode = mode
    }
}

extension Ledger {
    static let sampleLedger: [Ledger] = [
        Ledger(
            title: "Ledger 1", current: .cny, currencySymbol: "¥", logs: [], totalAmount: 1000,
            mode: LedgerMode.timeline.rawValue),
        Ledger(
            title: "Ledger 2", current: .usd, currencySymbol: "$", logs: [], totalAmount: 2000,
            mode: LedgerMode.category.rawValue),
        Ledger(
            title: "Ledger 3", current: .eur, currencySymbol: "€", logs: [], totalAmount: 3000,
            mode: LedgerMode.account.rawValue),
        Ledger(
            title: "Ledger 4", current: .gbp, currencySymbol: "£", logs: [], totalAmount: 4000,
            mode: LedgerMode.timeline.rawValue),
        Ledger(
            title: "Ledger 5", current: .jpy, currencySymbol: "¥", logs: [], totalAmount: 5000,
            mode: LedgerMode.timeline.rawValue),
        Ledger(
            title: "Ledger 6", current: .rub, currencySymbol: "₽", logs: [], totalAmount: 6000,
            mode: LedgerMode.timeline.rawValue),
        Ledger(
            title: "Ledger 7", current: .cny, currencySymbol: "¥", logs: [], totalAmount: 7000,
            mode: LedgerMode.timeline.rawValue),
        Ledger(
            title: "Ledger 8", current: .usd, currencySymbol: "$", logs: [], totalAmount: 8000,
            mode: LedgerMode.timeline.rawValue),
        Ledger(
            title: "Ledger 9", current: .eur, currencySymbol: "€", logs: [], totalAmount: 9000,
            mode: LedgerMode.timeline.rawValue),
        Ledger(
            title: "Ledger 10", current: .gbp, currencySymbol: "£", logs: [], totalAmount: 10000,
            mode: LedgerMode.timeline.rawValue),
    ]
}
