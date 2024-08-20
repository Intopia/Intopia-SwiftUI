/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct FormFieldInstructionsEndView: View {
    @State private var phonenum1 = ""
    @State private var phonenum2 = ""

    var body: some View {
        ScrollView {
            VStack {
                Text("Use accessibilityHint when a TextField has instructions.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("Use the Accessibility Inspector to check an element's hint content")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Put the most urgent content at the start of an accessibilityHint: errors then instructions.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                Text("All fields are required unless marked optional")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .fontWeight(.bold)
                Text("Phone number")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3)
                    .padding([.leading, .trailing])
                Text("Must be exactly 10 digits")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                    .italic()
                TextField("", text: $phonenum1, axis: .vertical)
                    .border(.primary)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.telephoneNumber)
                    .autocorrectionDisabled(true)
                    .keyboardType(.phonePad)
                    .accessibilityIdentifier("PhoneText1")
                    .accessibilityLabel("Phone number")
                    .accessibilityHint("Must be exactly 10 digits")
                    // accessibilityHint contains instruction text and required state
                Divider()
                    .padding([.leading, .trailing])
                Text("No prior mention of required status")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .fontWeight(.bold)
                Text("Phone number (required)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3)
                    .padding([.leading, .trailing])
                Text("Must be exactly 10 digits")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                    .italic()
                TextField("", text: $phonenum2, axis: .vertical)
                    .border(.primary)
                    .padding([.leading, .trailing])
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.telephoneNumber)
                    .autocorrectionDisabled(true)
                    .keyboardType(.phonePad)
                    .accessibilityIdentifier("PhoneText2")
                    .accessibilityLabel("Phone number, required")
                    // Label mentions required state for VoiceOver
                    .accessibilityInputLabels(["Phone number", "Phone number required"])
                    // Voice Control users can say "Tap Phone number" or "Tap phone number required" to interact
            }
            .navigationTitle("Form field instructions end")
        }
    }
}

#Preview {
    NavigationStack {
        FormFieldInstructionsEndView()
    }
}
