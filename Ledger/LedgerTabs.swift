//
//  LedgerTabs.swift
//  Ledger
//
//  Created by Yumin Xia on 2025/2/13.
//

import Foundation

enum LedgerTabs: String, CaseIterable {
    
    case ledger = "ledger"
    case analysis = "analysis"
    case setting = "setting"
    
    var icon: String {
        switch self {
        case .ledger:
            return "archivebox"
        case .analysis:
            return "house"
        case .setting:
            return "chart.pie"
        }
    }
}
