//
//  AddLedgerSheet.swift
//  Ledger
//
//  Created by Yumin Xia on 2025/2/13.
//

import SwiftUI
import SwiftUIRouter
import PopupView

struct AddLedgerSheet: View {
    @Binding var isPresented: Bool
    @State private var showAddTag: Bool = false

    @State private var ledgerName: String = ""
    @State private var currency: Currency = .cny
    @State private var ledgerMode: LedgerMode = .timeline
    @State private var tags: [Tag] = []

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
            HStack {
                Text("Tag")
//                TagSelector(selected: $tags)
                Button(
                    action: {
                        withAnimation {
                            showAddTag.toggle()
                        }
                    },
                    label: {
                        HStack(spacing: nil) {
                            Spacer()
                            Image(systemName: "chevron.right")
//                                .foregroundStyle(bgColor == .white ? .black : .white)
//                                .rotationEffect(.degrees((showDropdown ? 90 : 0)))
                        }
                    }
                )
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color(uiColor: .systemBackground))
        }
        .popup(isPresented: $showAddTag) {
            ChooseTagSheet(isPresented: $showAddTag)
        } customize: {
            $0
                .type(.default)
                .position(.bottom)
                .animation(.spring())
                .displayMode(.sheet)
                .backgroundColor(.black.opacity(0.5))
//                .closeOnTapOutside(false)
//                .closeOnTap(false)
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
