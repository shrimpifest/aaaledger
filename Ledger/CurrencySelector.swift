//
//  CurrencySelector.swift
//  Ledger
//
//  Created by Yumin Xia on 2025/2/14.
//

import SwiftUI

struct CurrencySelector: View {
    @Binding var selected: Currency
    let options: [Currency] = Currency.allCases

    @State var menuWdith: CGFloat = 200
    @State var buttonHeight: CGFloat = 50
    @State var maxItemDisplayed: Int = 8
    @State var bgColor: Color = .white
    @State var selectedOptionIndex: Int = 0
    @State var showDropdown: Bool = false
    @State private var scrollPosition: Int?

    var body: some View {
        VStack {
            Button(
                action: {
                    withAnimation {
                        showDropdown.toggle()
                    }
                },
                label: {
                    HStack(spacing: nil) {
                        Text(
                            selected.symbol + " " + options[selectedOptionIndex].rawValue
                        )
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
            .frame(width: menuWdith, height: buttonHeight, alignment: .leading)

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
                                        Text(options[index].rawValue)
                                            .font(.system(size: 16, weight: .regular))
                                        Text(options[index].symbol)
                                            .font(.system(size: 16, weight: .bold))

                                        Spacer()
                                        if index == selectedOptionIndex {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundStyle(
                                                    bgColor == .white ? .black : .white)
                                        }
                                    }
                                    .fontDesign(.rounded)
                                    .padding(.leading, 10)

                                }
                            )
                            .padding(.horizontal, 20)
                            .frame(width: menuWdith, height: buttonHeight, alignment: .leading)

                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollIndicators(.never)
                .scrollPosition(id: $scrollPosition)
                .scrollDisabled(options.count <= 3)
                .frame(height: scrollViewHeight)
                .onAppear {
                    scrollPosition = selectedOptionIndex
                }
            }
        }
    }
}

#Preview {
    CurrencySelector(selected: .constant(.cny))
}
