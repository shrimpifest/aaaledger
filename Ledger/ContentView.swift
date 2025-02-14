//
//  ContentView.swift
//  Ledger
//
//  Created by Yumin Xia on 2025/2/13.
//

import SwiftData
import SwiftUI
import SwiftUIRouter

struct ContentView: View {
    @EnvironmentObject private var navigator: Navigator
    @State private var selectedTab: String = LedgerTabs.ledger.rawValue

    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(LedgerTabs.allCases, id: \.rawValue) { tab in
                RootRoutes()
                    .tabItem {
                        Image(systemName: tab.icon)
                        Text(tab.rawValue)
                            .fontDesign(.rounded)
                    }
                    .tint(.pink.opacity(0.6))
                    .tag(tab.rawValue)
            }
        }
        .tint(.pink.opacity(0.6))
        .onChange(of: selectedTab) { _, newSelected in
            let pathComponents = navigator.path.components(separatedBy: "/").dropFirst()
            if newSelected != pathComponents.first {
                navigator.navigate("/" + (newSelected))
            }
        }
        .onChange(of: navigator.path) { oldPath, newPath in
            print("current Path: \(newPath)")
        }
        .onAppear {
            navigator.navigate(LedgerTabs.ledger.rawValue)
        }
    }

}

struct RootRoutes: View {
    var body: some View {
        SwitchRoutes {
            Route("ledger", content: LedgerTabRoutes())
            Route("analysis", content: AnalysisTabRoutes())
            Route("setting", content: SettingTabRoutes())
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Navigator())
}
