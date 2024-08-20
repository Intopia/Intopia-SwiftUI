/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct ImagesView: View {
    var body: some View {
        List {
            Text("Decorative images")
                .accessibilityAddTraits(.isHeader)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.top)
            NavigationLink(destination: DecorativeImagesStartView()) {
                Text("Decorative image start state")
            }
            NavigationLink(destination: DecorativeImagesEndView()) {
                Text("Decorative image end state")
            }
            Text("Informative images")
                .accessibilityAddTraits(.isHeader)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.top)
            NavigationLink(destination: InformativeImagesStartView()) {
                Text("Informative image start state")
            }
            NavigationLink(destination: InformativeImagesEndView()) {
                Text("Informative image end state")
            }
            Text("Functional images")
                .accessibilityAddTraits(.isHeader)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.top)
            NavigationLink(destination: FunctionalImagesStartView()) {
                Text("Functional image start state")
            }
            NavigationLink(destination: FunctionalImagesEndView()) {
                Text("Functional image end state")
            }
            Text("Complex images")
                .accessibilityAddTraits(.isHeader)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.top)
            NavigationLink(destination: ComplexImagesStartView()) {
                Text("Complex image start state")
            }
            NavigationLink(destination: ComplexImagesEndView()) {
                Text("Complex image end state")
            }
        }
        .navigationTitle("Images")
    }
}

#Preview {
    NavigationStack {
        ImagesView()
    }
}
