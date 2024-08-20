/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct ButtonGroupEndView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Use accessibilityElement(.contain) to group related elements in code.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("Add an accessibilityLabel to the group container to provide context when a user enters a group.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Divider()
                    .padding()
                Text("Which one are you?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title3)
                VStack {
                    PersonalityButton(label: "Yes")
                    PersonalityButton(label: "No")
                    PersonalityButton(label: "Maybe")
                    PersonalityButton(label: "Huh?")
                }
                .accessibilityElement(children: .contain)
                .accessibilityLabel("Which one are you?")
                .accessibilityIdentifier("ButtonGroup")
                // Related buttons are in an accessibility-aware container
                // Container is labelled for improved context
            }
            .navigationTitle("Related button group end")
        }
    }
}

#Preview {
    NavigationStack {
        ButtonGroupEndView()
    }
}
