//
//  SettingTabRoutes.swift
//  Ledger
//
//  Created by Yumin Xia on 2025/2/13.
//

import SwiftUI
import SwiftUIRouter
import SwiftData

struct SettingTabRoutes: View {
    var body: some View {
        SwitchRoutes {
            Route(content: SettingTabView())
        }
    }
}

struct SettingTabView: View {
    var body: some View {
        Text("Settings")
    }
}

#Preview {
    SettingTabRoutes()
        .environmentObject(Navigator())
}
