/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct ButtonGroupStartView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("The buttons below are not grouped in code.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("They do not have a programmatic group label, which would provide context to assistive technologies when entering the group.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Use accessibilityElement(.contain) on group containers and accessibilityLabel to label them.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                Text("Which one are you?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .font(.title3)
                PersonalityButton(label: "Yes")
                PersonalityButton(label: "No")
                PersonalityButton(label: "Maybe")
                PersonalityButton(label: "Huh?")
                // FIXME: - Add group container
                // FIXME: - Add label to group container
            }
            .navigationTitle("Related button group start")
        }
    }
}

struct PersonalityButton : View {
    let label: String
    @State private var showAlert = false
    @AccessibilityFocusState private var buttonFocussed
    
    var body: some View {
        Button(action: {
            showAlert = true
        }, label: {
            Text(label)
        })
        .buttonStyle(.borderedProminent)
        .accessibilityIdentifier("\(label)Button")
        .accessibilityFocused($buttonFocussed)
        .alert("You pressed \(label)", isPresented: $showAlert) {
            Button("OK", role: .cancel) {
                buttonFocussed = true
            }
        }
    }
}

#Preview {
    ButtonGroupStartView()
}
