/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct LayoutView: View {
    var body: some View {
        List {
            Section(content: {
                NavigationLink(destination: DynamicTypeStartView()) {
                    Text("Dynamic type start state")
                }
                NavigationLink(destination: DynamicTypeEndView()) {
                    Text("Dynamic type end state")
                }
            }, header: {
                Text("Using dynamic type")
            })
            Section(content: {
                NavigationLink(destination: TruncationStartView()) {
                    Text("Truncation start state")
                }
                NavigationLink(destination: TruncationEndView()) {
                    Text("Truncation end state")
                }
            }, header: {
                Text("Avoiding truncation")
            })
            Section(content: {
                NavigationLink(destination: ResponsiveLayoutStartView()) {
                    Text("Responsive layout start state")
                }
                NavigationLink(destination: ResponsiveLayoutEndView()) {
                    Text("Responsive layout end state")
                }
            }, header: {
                Text("Responsive layout")
            })
        }
        .navigationTitle("Layout")
        .listStyle(.insetGrouped)
    }
}

#Preview {
    NavigationStack {
        LayoutView()
    }
}
