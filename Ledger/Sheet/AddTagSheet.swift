//
//  AddTagSheet.swift
//  Ledger
//
//  Created by Yumin Xia on 2025/2/20.
//

import SwiftData
import SwiftUI
import SwiftUIRouter

struct AddTagSheet: View {
    @EnvironmentObject private var navigator: Navigator
    @Binding var isPresented: Bool
    @State private var tagName: String = ""
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(
                    action: {
                        isPresented.toggle()
                    },
                    label: {
                        Text("Confirm")
                    }
                )
            }
            // TODO: add tag icon picker
            TextField("Tag Name", text: $tagName)
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
    AddTagSheet(isPresented: .constant(true))
        .environmentObject(Navigator())
        .modelContainer(DataController.shared.tagContainer)

}
