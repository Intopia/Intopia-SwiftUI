/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct AccessibilityInputLabelsStartView: View {
    @State private var showCloseAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("The icon button below is labelled \"Close\". A sighted Voice Control user doesn't know this, and could try alternate prompts like \"Dismiss\".")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("The link below says \"More\" on screen but has an accessibilityLabel \"More about birds\". Voice Control users can't activate the link as expected by saying \"Tap More\".")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Use accessibilityInputLabels to define succinct speech-friendly labels for an element.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                Text("Icon button - add multiple input labels")
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
                .accessibilityIdentifier("OneLabelButton")
                .alert(isPresented: $showCloseAlert, content: {
                    Alert(title: Text("Close button pressed"))
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .accessibilityLabel("Close")
                // FIXME: - Add several generic input labels that sighted Voice Control users might say to activate the button
                Divider()
                    .padding()
                Text("Enhanced link - restore Voice Control compatibility")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title3)
                Link(destination: URL(string: "https://stonemaiergames.com/games/wingspan/")!, label: {
                    Text("More")
                        .font(.title3)
                        .underline()
                })
                .accessibilityIdentifier("AugmentedLink")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .accessibilityRemoveTraits(.isButton)
                .accessibilityLabel("More about birds")
                // FIXME: - Add input label so sighted Voice Control users can say what they see on screen to activate the link
            }
            .navigationTitle("accessibilityInputLabels start")
        }
    }
}

#Preview {
    NavigationStack {
        AccessibilityInputLabelsStartView()
    }
}
