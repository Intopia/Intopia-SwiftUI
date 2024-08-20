/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct AccessibilityLabelEndView: View {
    @State private var showAlert = false
    @AccessibilityFocusState private var buttonFocussed

    var body: some View {
        ScrollView {
            VStack {
                Text("Use accessibilityLabel when an element doesn't have a meaningful label in code.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("Use the Accessibility Inspector to check an element's label.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Be careful that a custom accessibilityLabel doesn't unintentionally impact the Voice Control experience")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                Text("Labelled icon button")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .font(.title3)
                Button(action: {
                    showAlert = true
                }, label: {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44)
                })
                .accessibilityIdentifier("LabelledIconButton")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .alert("You pressed \"Add user\"", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {
                        buttonFocussed = true
                    }
                }
                .accessibilityFocused($buttonFocussed)
                .accessibilityLabel("Add user")
                // Label for assistive technologies
                Divider()
                    .padding()
                Text("Enhanced generic link label")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title3)
                Link(destination: URL(string: "https://stonemaiergames.com/games/wingspan/")!, label: {
                    Text("More")
                        .font(.title3)
                        .underline()
                })
                .accessibilityIdentifier("MeaningfulLink")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .accessibilityRemoveTraits(.isButton)
                .accessibilityLabel("More about birds")
                // Enhanced label provides context
            }
            .navigationTitle("accessibilityLabel end")
        }
    }
}

#Preview {
    NavigationStack {
        AccessibilityLabelEndView()
    }
}
