/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct ComplexImagesEndView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Use accessibilityLabel to add a short description to compex images.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("Use the Accessibility Inspector to check an Image's label")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Add an on-screen detailed description nearby.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                Text("HTML content models")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .accessibilityAddTraits(.isHeader)
                Image("complex")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading, .trailing])
                    .accessibilityIdentifier("ComplexImage")
                    .accessibilityLabel("Venn diagram of HTML content category relationships. Detailed description below.")
                    // Short high-level image description
                DisclosureGroup("Image description") {
                    Text("Content categories include:\n1. Flow content\n2. Metadata content\n3. Sectioning content\n4. Heading content\n5. Phrasing content\n6. Interactive content\n7. Embedded content")
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        // On-screen description of image
                }
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .accessibilityIdentifier("DetailedDescription")
                Link(destination: URL(string: "https://html.spec.whatwg.org/multipage/dom.html#content-models")!) {
                    Text("HTML content model specification")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .underline()
                        .padding([.leading, .trailing])
                }
            }
            .navigationTitle("Complex images end")
        }
    }
}

#Preview {
    NavigationStack {
        ComplexImagesEndView()
    }
}
