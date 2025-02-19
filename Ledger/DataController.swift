//
//  DataController.swift
//  Ledger
//
//  Created by Yumin Xia on 2025/2/18.
//

import SwiftUI
import SwiftData

class DataController {
    static let shared = DataController()
    
    lazy var ledgerContainer: ModelContainer = {
        let schema = Schema([
            Ledger.self
        ])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create Ledger ModelContainer: \(error)")
        }
    }()
    
    lazy var logContainer: ModelContainer = {
        let schema = Schema([
            Log.self
        ])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create Log ModelContainer: \(error)")
        }
    }()
    
    // Container for user settings
//    lazy var settingsContainer: ModelContainer = {
//        let schema = Schema([
//            Tag.self,
//            UserPreferences.self
//        ])
//        let modelConfiguration = ModelConfiguration(
//            schema: schema,
//            isStoredInMemoryOnly: false,
//            groupContainer: nil,
//            cloudKitContainerIdentifier: nil,
//            schema: schema,
//            storageLocation: .groupContainer("settings")  // Different storage location
//        )
//        
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create Settings ModelContainer: \(error)")
//        }
//    }()
}
