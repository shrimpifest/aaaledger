//
//  AddLedgerSheet.swift
//  Ledger
//
//  Created by Yumin Xia on 2025/2/13.
//

import SwiftUI
import SwiftUIRouter

struct AddLedgerSheet: View {
    @Binding var isPresented: Bool
    @State private var ledgerName: String = ""
    @State private var currency: Currency = .cny
    @State private var ledgerMode: LedgerMode = .timeline
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button("Cancel") {
                    isPresented = false
                }
                Spacer()
                Text("New Ledger")
                Spacer()
                Button("Done") {
                    isPresented = false
                }
            }

            TextField("Ledger Name", text: $ledgerName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack {
                Text("Currency")
                CurrencySelector(selected: $currency)
            }
            .zIndex(100)
            HStack {
                Text("Display Mode")
                LedgerModeSelector(selected: $ledgerMode)
            }
            .zIndex(99)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color(uiColor: .systemBackground))
        }
    }
}

#Preview {
    AddLedgerSheet(isPresented: .constant(true))
}

#Preview {
    ContentView()
        .environmentObject(Navigator())
}
