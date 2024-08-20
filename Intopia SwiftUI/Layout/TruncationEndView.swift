/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct TruncationEndView: View {
    @State private var addressLine1 = ""
    
    var body: some View {
        // Top-level ScrollView ensures content can always be accessed below the fold at larger text sizes.
        ScrollView {
            VStack {
                Text("Use a top-level ScrollView to ensure content is always available even when it pushes below the fold")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("Avoid using maxHeight, height and linelimit since it can truncate content at larger text sizes.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Applying vertical axis to TextField causes the content to wrap on screen rather than scrolling off screen, which may be easier to read and review.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                Text("This text does not have a fixed container maxHeight defined in code. It will grow and wrap as much as needed, and the content will not truncate.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    // No maxHeight defined
                Divider()
                    .padding([.leading, .trailing])
                Text("This text does not have an absolute fixed container height defined in code. It will not truncate, and the content will wrap and grow as much as needed.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    // No fixed height defined
                Divider()
                    .padding([.leading, .trailing])
                Text("This text does not have a line limit applied to it. It should not truncate because it can wrap to as many rows as needed.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    // No line limit defined
                Divider()
                    .padding([.leading, .trailing])
                Text("Address line 1")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .top])
                    .font(.title3)
                TextField("", text: $addressLine1, axis: .vertical)
                    .keyboardType(.default)
                    .textContentType(.streetAddressLine1)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.words)
                    .border(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                    .font(.title3)
                    .accessibilityLabel("Address line 1")
                // Vertical axis enables text field content to wrap on screen rather than scroll.
            }
            .navigationTitle("Truncation end")
        }
    }
}

#Preview {
    NavigationStack {
        TruncationEndView()
    }
}
