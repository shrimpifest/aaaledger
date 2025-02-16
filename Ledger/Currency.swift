//
//  Currency.swift
//  Ledger
//
//  Created by Yumin Xia on 2025/2/13.
//

import Foundation

enum Currency: String, CaseIterable {
    case cny = "CNY"
    case usd = "USD"
    case eur = "EUR"
    case gbp = "GBP"
    case aud = "AUD"
    case cad = "CAD"
    case chf = "CHF"
    case hkd = "HKD"
    case inr = "INR"
    case jpy = "JPY"
    case rub = "RUB"
    case sgd = "SGD"
    case thb = "THB"
    case twd = "TWD"
    case zar = "ZAR"

    var symbol: String {
        switch self {
        case .cny:
            return "¥"
        case .usd:
            return "$"
        case .eur:
            return "€"
        case .gbp:
            return "£"
        case .aud:
            return "$"
        case .cad:
            return "$"
        case .chf:
            return "CHF"
        case .hkd:
            return "$"
        case .inr:
            return "₹"
        case .jpy:
            return "¥"
        case .rub:
            return "₽"
        case .sgd:
            return "$"
        case .thb:
            return "฿"
        case .twd:
            return "NT$"
        case .zar:
            return "R"
        }
    }
}
