//
//  LedgerDetailView.swift
//  Ledger
//
//  Created by Yumin Xia on 2025/2/17.
//

import SwiftUI
import SwiftUIRouter

struct LedgerDetailView: View {
    @EnvironmentObject private var navigator: Navigator
    @State var ledgerId: String
    @State var ledger: Ledger = .init()
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(
                        action: {
                            navigator.navigate("/ledger")
                        },
                        label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundStyle(.pink.opacity(0.3))
                        })
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text(ledger.title)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundStyle(.pink.opacity(0.3))
                    Spacer()
                }
            }
            Spacer()
        }
        .padding(.horizontal, 20)
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            self.ledger = Ledger.sampleLedgers[0]
        }
    }
}

#Preview {
    LedgerDetailView(ledgerId: "123")
        .environmentObject(Navigator())
}
