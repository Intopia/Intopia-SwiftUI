/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct DecorativeImagesStartView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("The decorative image below is not labelled in code.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("VoiceOver will say the file name which may not be user-friendly or needed.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Use accessibilityHidden to tell assistive technologies to ignore decorative images.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                Image(systemName: "creditcard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60)
                    .padding()
                    .accessibilityIdentifier("DecorativeImage")
                    // FIXME: - Hide decorative image from assistive technologies
            }
            .navigationTitle("Decorative images start")
        }
    }
}

#Preview {
    NavigationStack {
        DecorativeImagesStartView()
    }
}