//
//  TagSelector.swift
//  Ledger
//
//  Created by Yumin Xia on 2025/2/17.
//

import SwiftUI

struct TagSelector: View {
    @Binding var selected: [Tag]
    let options: [Tag] = []

    @State var menuWdith: CGFloat = 200
    @State var buttonHeight: CGFloat = 45
    @State var maxItemDisplayed: Int = 8
    @State var bgColor: Color = .black
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
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(bgColor == .white ? .black : .white)
                            .rotationEffect(.degrees((showDropdown ? 90 : 0)))
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
                                        Text(options[index].title.capitalized)
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
            } else if showDropdown && options.isEmpty {
                Button(action: {
                    
                }, label: {
                    HStack {
                        Image(systemName: "plus")
                            .fontWeight(.semibold)
                        Text("add tag")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                    }
                    .foregroundStyle(bgColor == .white ? .black : .white)
                    .padding(.vertical, 10)
                })
            }
        }
        .background(RoundedRectangle(cornerRadius: 14).fill(bgColor))
        .frame(width: menuWdith, height: buttonHeight, alignment: .top)
        .zIndex(100)
        .onAppear {
            // TODO: fetch tags
        }
    }
}

#Preview {
    @Previewable @State var tags: [Tag] = []
    TagSelector(selected: $tags)
}
