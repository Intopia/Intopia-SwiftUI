/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct TruncationStartView: View {
    @State private var addressLine1: String = ""
    
    var body: some View {
        // FIXME: Add a top-level ScrollView so the page can scroll when content gets too long.
        VStack {
            Text("This is my text that contains an inline link to [CommBank](https://www.commbank.com.au).")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            Text("This page contains several poor code practices related to truncation.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            HStack(alignment: .top) {
                Text("\u{2022}")
                    .accessibilityHidden(true)
                Text("Absolute maxHeight applied to text container")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding([.leading, .trailing])
            HStack(alignment: .top) {
                Text("\u{2022}")
                    .accessibilityHidden(true)
                Text("Absolute height applied to text container")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding([.leading, .trailing])
            HStack(alignment: .top) {
                Text("\u{2022}")
                    .accessibilityHidden(true)
                Text("Line limit applied to text container")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding([.leading, .trailing])
            HStack(alignment: .top) {
                Text("\u{2022}")
                    .accessibilityHidden(true)
                Text("No vertical axis applied to text field")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding([.leading, .trailing])
            HStack(alignment: .top) {
                Text("\u{2022}")
                    .accessibilityHidden(true)
                Text("No ScrollView applied at top level")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding([.leading, .trailing])
            Text("The negative effects become more pronounced at larger text size settings.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            Divider()
                .padding([.leading, .trailing])
            Text("This text has a fixed container maxHeight defined in code. It may show all the text depending on the screen size and text size settings, but any text that doesn't fit will truncate.")
                .frame(maxWidth: .infinity, maxHeight: 150, alignment: .leading)
                .padding()
                // FIXME: Remove the maxHeight restriction
            Divider()
                .padding([.leading, .trailing])
            Text("This text has an absolute fixed container height defined in code. It will also truncate once the contents exceed the available defined space.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 70)
                .padding()
                // FIXME: Remove the height restriction
            Divider()
                .padding([.leading, .trailing])
            Text("This text has a line limit applied to it.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
                .padding()
                // FIXME: Remove the line limiter
            Divider()
                .padding([.leading, .trailing])
            Text("Address line 1")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing, .top])
                .font(.title3)
            TextField("", text: $addressLine1)
                .keyboardType(.default)
                .textContentType(.streetAddressLine1)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.words)
                .border(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing])
                .font(.title3)
                .accessibilityLabel("Address line 1")
            // FIXME: Add vertical axis to text field
        }
        .navigationTitle("Truncation start")
    }
}


#Preview {
    NavigationStack {
        TruncationStartView()
    }
}
