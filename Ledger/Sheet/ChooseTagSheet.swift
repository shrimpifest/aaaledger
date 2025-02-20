//
//  ChooseTagSheet.swift
//  Ledger
//
//  Created by Yumin Xia on 2025/2/20.
//

import PopupView
import SwiftData
import SwiftUI
import SwiftUIRouter

struct ChooseTagSheet: View {
    @EnvironmentObject private var navigator: Navigator
    @Binding var isPresented: Bool
    @Query(sort: \Tag.title) private var tagList: [Tag]
    @State private var selectedTags: Set<String> = []
    @State private var showAddTag: Bool = false

    var body: some View {
        VStack {
            HStack {
                Button(
                    action: {
                        isPresented.toggle()
                    },
                    label: {
                        Text("Back")
                    }
                )
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
            if !tagList.isEmpty {
                List(tagList, id: \.id) { tag in
                    HStack {
                        Text(tag.title)
                        Spacer()
                        if selectedTags.contains(tag.id) {
                            Image(systemName: "checkmark.circle.fill")
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if selectedTags.contains(tag.id) {
                            selectedTags.remove(tag.id)
                        } else {
                            selectedTags.insert(tag.id)
                        }
                    }
                }
            } else {
                Text("No tags available")
                    .foregroundColor(.gray)
            }
            Button(
                action: {
                    showAddTag.toggle()
                },
                label: {
                    Text("Add Tag")
                }
            )
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
            AddTagSheet(isPresented: $showAddTag)
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
    ChooseTagSheet(isPresented: .constant(true))
        .environmentObject(Navigator())
        .modelContainer(DataController.shared.tagContainer)

}
