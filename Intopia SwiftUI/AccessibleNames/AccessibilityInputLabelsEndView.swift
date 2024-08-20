/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct AccessibilityInputLabelsEndView: View {
    @State private var showCloseAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Apply accessibilityInputLabels when an element's accessible name is long, complex, or differs from on-screen text.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("accessibilityInputLabels is used by Voice Control and external keyboard to identify / activate an element.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Use the Accessibility Inspector to check an element's accessibilityInputLabels.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                Text("Icon button with multiple input labels")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .font(.title3)
                Button(action: {
                    showCloseAlert = true
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 44, height: 44)
                })
                .accessibilityIdentifier("MultiLabelButton")
                .alert(isPresented: $showCloseAlert, content: {
                    Alert(title: Text("Close / dismiss / shut button pressed"))
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .accessibilityLabel("Close")
                .accessibilityInputLabels(["Close", "Dismiss", "Shut"])
                // Several generic "Close"-adjacent labels added for Voice Control
                Divider()
                    .padding()
                Text("Voice Control-compatible enhanced link")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title3)
                Link(destination: URL(string: "https://stonemaiergames.com/games/wingspan/")!, label: {
                    Text("More")
                        .font(.title3)
                        .underline()
                })
                .accessibilityIdentifier("FixedLink")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .accessibilityRemoveTraits(.isButton)
                .accessibilityLabel("More about birds")
                .accessibilityInputLabels(["More", "More about birds"])
                // Prioritising "More" as a speech trigger since it matches on-screen text
            }
            .navigationTitle("accessibilityInputLabels end")
        }
    }
}

#Preview {
    NavigationStack {
        AccessibilityInputLabelsEndView()
    }
}
