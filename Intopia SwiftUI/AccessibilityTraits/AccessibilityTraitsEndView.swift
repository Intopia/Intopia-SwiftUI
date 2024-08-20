/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct AccessibilityTraitsEndView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Use accessibilityAddTraits and accessibilityRemoveTraits when an element is missing traits, or its predefined traits are misleading")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("By default, VoiceOver says the trait after the element label and value, before the accessibilityHint")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Use the Accessibility Inspector to check an element's traits.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                HasTraitAccountTile()
                Divider()
                    .padding([.leading, .trailing])
                Link(destination: URL(string: "https://intopia.digital")!) {
                        Text("Intopia home page")
                        .underline()
                        .font(.title3)
                    }
                    .accessibilityIdentifier("NoButtonLink")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .accessibilityRemoveTraits(.isButton)
                    // Superfluous button trait removed. Link trait is still in effect.
            }
            .navigationTitle("Accessibility traits end")
        }
    }
}

struct HasTraitAccountTile : View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.colorScheme) var colorScheme
    @State private var showAccountDetails = false
    @AccessibilityFocusState private var isTileFocused: Bool

    var body : some View {
        let layout = (dynamicTypeSize > DynamicTypeSize.xxxLarge) ? AnyLayout(VStackLayout(alignment: .leading)) : AnyLayout(HStackLayout(alignment: .top))
        HStack(alignment: .top) {
            if (dynamicTypeSize <= DynamicTypeSize.xxxLarge) {
                Image(systemName: "creditcard")
                    .accessibilityHidden(true)
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("Personal Account #3333")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .accessibilityHidden(true)
                }
                layout {
                    Text("BSB: 111-222")
                    Text("Acc: 11-222-3333")
                        .accessibilityLabel("Account number 1 1, 2 2 2, 3 3 3 3")
                }
                layout {
                    Text("Available balance")
                    Spacer()
                    Text("+ $100.00")
                }
                layout {
                    Text("Current balance")
                    Spacer()
                    Text("+ $100.00")
                }
            }
        }
        .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 2)
        )
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(colorScheme == .dark ? Color.black : Color.white)
                .shadow(color: .gray, radius: 5, x: 4, y: 4)
        )
        .padding()
        .accessibilityFocused($isTileFocused)
        .accessibilityInputLabels(["Personal account"])
        .accessibilityElement(children: .combine)
        .accessibilityHint("View account transaction list")
        .accessibilityAddTraits(.isButton)
        // Button trait applied using accessibilityAddTraits
        .accessibilityIdentifier("ButtonTraitTile")
        .onTapGesture {
            showAccountDetails = true
        }
        .alert("Account tile tapped", isPresented: $showAccountDetails) {
            Button("OK", role: .cancel) {
                isTileFocused = true
            }
        }
    }
}


#Preview {
    NavigationStack {
        AccessibilityTraitsEndView()
    }
}
