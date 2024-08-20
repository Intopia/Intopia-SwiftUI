/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct AccessibilityLabelStartView: View {
    @State private var showAlert = false
    @AccessibilityFocusState private var buttonFocussed

    var body: some View {
        ScrollView {
            VStack {
                Text("The icon button below is not labelled in code.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("The link label below is generic, it's impossible to know what it's about.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Use accessibilityLabel to define a custom label for an element.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                Text("Unlabelled icon button")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .font(.title3)
                
                // MARK: - Unlabelled button
                Button(action: {
                    showAlert = true
                }, label: {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44)
                })
                .accessibilityIdentifier("UnlabelledIconButton")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .alert("You pressed \"Add user\"", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {
                        buttonFocussed = true
                    }
                }
                .accessibilityFocused($buttonFocussed)
                // FIXME: - Add text label to Button
                
                Divider()
                    .padding()
                
                Text("Generic link")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title3)
                
                // MARK: - Generic link label
                Link(destination: URL(string: "https://stonemaiergames.com/games/wingspan/")!, label: {
                    Text("More")
                        .font(.title3)
                        .underline()
                })
                .accessibilityIdentifier("GenericLink")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .accessibilityRemoveTraits(.isButton)
                // FIXME: - Added contextual label to Link
            }
            .navigationTitle("accessibilityLabel start")
        }
    }
}

#Preview {
    NavigationStack {
        AccessibilityLabelStartView()
    }
}
