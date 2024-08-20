/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct AccessibilityHintEndView: View {
    @State private var phonenum = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Use accessibilityHint when a TextField has instructions or error text.")
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
                Text("Phone number")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3)
                    .padding([.leading, .trailing, .top])
                Text("Must be exactly 10 digits")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                    .italic()
                TextField("", text: $phonenum, axis: .vertical)
                    .accessibilityIdentifier("PhoneNumber")
                    .border(.primary)
                    .padding([.leading, .trailing])
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.telephoneNumber)
                    .autocorrectionDisabled(true)
                    .accessibilityLabel("Phone number")
                    .accessibilityHint("Error: Phone number is required, Must be exactly 10 digits")
                HStack(alignment: .top) {
                    Image(systemName: "exclamationmark.octagon")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .accessibilityHidden(true)
                    Text("Error: Phone number is required")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing])
            }
            .navigationTitle("accessibilityHint end")
        }
    }
}

#Preview {
    NavigationStack {
        AccessibilityHintEndView()
    }
}
