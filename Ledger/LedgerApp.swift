//
//  LedgerApp.swift
//  Ledger
//
//  Created by Yumin Xia on 2025/2/13.
//

import SwiftUI
import SwiftData

@main
struct LedgerApp: App {
    let ledgerContainer = DataController.shared.ledgerContainer
    let logContainer = DataController.shared.logContainer

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(ledgerContainer)
        .modelContainer(logContainer)
    }
}
