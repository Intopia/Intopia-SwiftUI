/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct ComplexImagesStartView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("The Venn diagram below needs a meaningful description.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("Add a short description to the image indicating where the details are located.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Then add an on-screen detailed description near the image.")
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
                    // FIXME: - Add short description to image that mentions the location of a detailed description
                // FIXME: - Add separate on-screen detailed description of Venn diagram
                Link(destination: URL(string: "https://html.spec.whatwg.org/multipage/dom.html#content-models")!) {
                    Text("HTML content model specification")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .underline()
                        .padding([.leading, .trailing])
                }
            }
            .navigationTitle("Complex images start")
        }
    }
}

#Preview {
    NavigationStack {
        ComplexImagesStartView()
    }
}
