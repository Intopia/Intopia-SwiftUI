/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct DynamicTypeStartView: View {
    private var myFixedFont = Font.custom("Fixed", fixedSize: 17)
    // FIXME: Add a custom font that uses basic scaling.
    // FIXME: Add a custom font that uses relative scaling.

    var body: some View {
        ScrollView {
            VStack {
                Text("The 3 text samples at the bottom of this page have fixed text sizes defined.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("The text will not scale dynamically in line with the device's text size settings.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Do not use fixed fonts or absolute sizes when defining text.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                Text("This text has a fixed size defined in code. This text won't scale to match the device's text size setting, which is not very helpful.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 17))
                    .padding()
                    // FIXME: Update this text to use a built-in scalable font.
                Divider()
                    .padding([.leading, .trailing])
                Text("This text uses a custom font which has been defined with a fixed size. It will also ignore the device text size settings so some people will find it hard to read.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(myFixedFont)
                    .padding()
                    // FIXME: Update this text to use a custom basic scaling font.
                Divider()
                    .padding([.leading, .trailing])
                Text("This text references the same fixed size custom font. Using these fixed font techniques is very exclusionary to people with low vision.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(myFixedFont)
                    .padding()
                    // FIXME: Update this text to use a custom relative scaling font.
            }
            .navigationTitle("Dynamic type start")
        }
    }
}

#Preview {
    NavigationStack {
        DynamicTypeStartView()
    }
}
