//
//  LedgerModeSelector.swift
//  Ledger
//
//  Created by Yumin Xia on 2025/2/14.
//

import Foundation
import SwiftUI

enum LedgerMode: String, CaseIterable {
    case timeline
    case category
    case account
}

struct LedgerModeSelector: View {
    @Binding var selected: LedgerMode
    let options: [LedgerMode] = LedgerMode.allCases

    @State var menuWdith: CGFloat = 200
    @State var buttonHeight: CGFloat = 45
    @State var maxItemDisplayed: Int = 8
    @State var bgColor: Color = .black
    @State var selectedOptionIndex: Int = 0
    @State var showDropdown: Bool = false
    @State private var scrollPosition: Int?
    var body: some View {
        VStack {
            VStack {
                Button(
                    action: {
                        withAnimation {
                            showDropdown.toggle()
                        }
                    },
                    label: {
                        HStack(spacing: nil) {
                            Text(selected.rawValue.capitalized)
                                .fontDesign(.rounded)
                                .foregroundStyle(bgColor == .white ? .black : .white)
                            Spacer()
                            if !options.isEmpty {
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(bgColor == .white ? .black : .white)
                                    .rotationEffect(.degrees((showDropdown ? 90 : 0)))
                            }
                        }
                    }
                )
                .padding(.horizontal, 20)
                .frame(width: menuWdith, height: buttonHeight)
                .frame(maxWidth: .infinity)

                if showDropdown && !options.isEmpty {
                    let scrollViewHeight: CGFloat =
                        options.count > maxItemDisplayed
                        ? (buttonHeight * CGFloat(maxItemDisplayed))
                        : (buttonHeight * CGFloat(options.count))
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(0..<options.count, id: \.self) { index in
                                Button(
                                    action: {
                                        withAnimation {
                                            selectedOptionIndex = index
                                            showDropdown.toggle()
                                        }

                                    },
                                    label: {
                                        HStack {
                                            Text(options[index].rawValue.capitalized)
                                                .foregroundStyle(
                                                    bgColor == .white ? .black : .white)
                                            Spacer()
                                            if index == selectedOptionIndex {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .foregroundStyle(
                                                        bgColor == .white ? .black : .white)

                                            }
                                        }

                                    }
                                )
                                .padding(.horizontal, 20)
                                .frame(width: menuWdith, height: buttonHeight, alignment: .leading)

                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollPosition(id: $scrollPosition)
                    .scrollDisabled(options.count <= 3)
                    .scrollIndicators(.hidden)
                    .frame(height: scrollViewHeight)
                    .onAppear {
                        scrollPosition = selectedOptionIndex
                    }
                }
            }
            .background(RoundedRectangle(cornerRadius: 14).fill(bgColor))
        }
        .frame(width: menuWdith, height: buttonHeight, alignment: .top)
        .zIndex(100)
    }
}

#Preview {
    LedgerModeSelector(selected: .constant(.timeline))
}
