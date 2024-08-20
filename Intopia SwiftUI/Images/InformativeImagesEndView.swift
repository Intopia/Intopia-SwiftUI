/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct InformativeImagesEndView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Use accessibilityLabel to label informative images.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("Use the Accessibility Inspector to check an Image's label")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Be careful not to label decorative images.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                Text("Burmese cat colours")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .accessibilityAddTraits(.isHeader)
                Text("The breed's original standard colour is a distinctly rich dark brown. The first blue Burmese was born in 1955 in Britain, followed by red, cream, and tortoiseshell over the next decades. Chocolate first appeared in the United States. Lilac, the last major variant to appear, was likewise developed in the USA beginning in 1971.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .bottom])
                Image("BurmeseCat")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading, .trailing])
                    .accessibilityIdentifier("InformativeImage")
                    .accessibilityLabel("An adult cat sits on a table beside a Coke can labelled \"Share a Coke with the Chief\". His eyes are yellow-gold, his whiskers are white and his medium-length coat is a warm silver-platinum colour.")
                    // Literal image description, as distinct from the on-screen caption
                Text("Chief is a male lilac Burmese cat")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                    .italic()
                Text("Content adapted from [Burmese cat - Wikipedia](https://en.wikipedia.org/wiki/Burmese_cat#Coat_and_colour)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            .navigationTitle("Informative images end")
        }
    }
}

#Preview {
    NavigationStack {
        InformativeImagesEndView()
    }
}
