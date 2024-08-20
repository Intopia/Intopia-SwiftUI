/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct FunctionalImagesStartView: View {
    @State private var dismissTapped = false
    @State private var deleteTapped = false
    @AccessibilityFocusState private var dismissFocussed: Bool
    @AccessibilityFocusState private var deleteFocussed: Bool

    var body: some View {
        ScrollView {
            VStack {
                Text("The icon buttons below are not labelled in code.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("The image filename could mislead users as to the button action")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Use accessibilityLabel to define a label for an element.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                Text("Unlabelled icon button #1")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .font(.title3)
                Button(action: {
                    dismissTapped = true
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 44, height: 44)
                        // FIXME: - Add text label to Image
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .accessibilityIdentifier("FunctionalImage1")
                .accessibilityFocused($dismissFocussed)
                .alert("Dismiss button tapped", isPresented: $dismissTapped) {
                    Button("OK", role: .cancel) {
                        dismissFocussed = true
                    }
                }
                Divider()
                    .padding()
                Text("Unlabelled icon button #2")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title3)
                Button(action: {
                    deleteTapped = true
                }, label: {
                    Image(systemName: "trash.circle.fill")
                        .resizable()
                        .frame(width: 44, height: 44)
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .accessibilityIdentifier("FunctionalImage2")
                // FIXME: - Add text label to Button
                .accessibilityFocused($deleteFocussed)
                .alert("Delete button tapped", isPresented: $deleteTapped) {
                    Button("OK", role: .cancel) {
                        deleteFocussed = true
                    }
                }
            }
            .navigationTitle("Functional images start")
        }
    }
}

#Preview {
    NavigationStack {
        FunctionalImagesStartView()
    }
}
