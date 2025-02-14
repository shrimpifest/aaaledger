//  Created by Yumin Xia on 2025/2/13.
//

import PopupView
import SwiftUI
import SwiftUIRouter

struct LedgerTabRoutes: View {
    var body: some View {
        SwitchRoutes {
            Route(
                content: LedgerTabView()
            )
        }
    }
}

struct LedgerTabView: View {
    @State private var showAddLedger: Bool = false
    @State private var ledgerList: [Ledger] = []

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Menu {
                    Button(
                        action: {
                            showAddLedger.toggle()
                        },
                        label: {
                            Text("Add Ledger")
                        })
                } label: {
                    Image(systemName: "plus")
                }
            }
            .padding(.vertical, 3)
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                ]) {
                    ForEach(ledgerList, id: \.id) { ledger in
                        LedgerCard(ledger: ledger)
                    }
                }
            }
            .scrollIndicators(.never)
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        .popup(isPresented: $showAddLedger) {
            AddLedgerSheet(isPresented: $showAddLedger)
        } customize: {
            $0
                .type(.default)
                .position(.bottom)
                .animation(.spring())
                .displayMode(.sheet)
                .backgroundColor(.black.opacity(0.5))
                .closeOnTapOutside(false)
                .closeOnTap(false)
        }
        .onAppear {
            self.ledgerList = Ledger.sampleLedger
        }
    }

    @ViewBuilder
    func LedgerCard(ledger: Ledger) -> some View {
        VStack {
            Text(ledger.title)
            Text(ledger.currencySymbol + "\(ledger.totalAmount)")
        }
        .frame(maxWidth: .infinity)
        .frame(height: 250)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.1))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Navigator())
}
