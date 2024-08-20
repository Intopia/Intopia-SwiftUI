/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct FormFieldInstructionsStartView: View {
    @State private var phonenum1 = ""
    @State private var phonenum2 = ""

    var body: some View {
        ScrollView {
            VStack {
                Text("The phone number TextField below is labelled in code, but VoiceOver users don't hear the 10-digit instruction in the TextField announcement.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("Use accessibilityHint to add instruction context to a TextField.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Ensure required status is reported to all users without interfere with interaction")
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
                    .padding([.leading, .trailing, .top])
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
                // FIXME: - Add accessibilityHint with instruction text
                // FIXME: - Augment accessibilityHint with required state
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
                    .accessibilityHint("Must be exactly 10 digits")
                // FIXME: - Add accessibilityInputLabels to maintain Voice Control compatibility
            }
            .navigationTitle("Form field instructions start")
        }
    }
}

#Preview {
    NavigationStack {
        FormFieldInstructionsStartView()
    }
}
