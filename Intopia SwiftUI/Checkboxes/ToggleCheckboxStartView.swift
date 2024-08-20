/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct ToggleCheckboxStartView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("These checkboxes are built from generic elements (Image + Text). It is a poor accessibility experience")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                HStack(alignment: .top) {
                    Text("\u{2022}")
                        .accessibilityHidden(true)
                    Text("No Trait or usage instructions")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding([.leading, .trailing])
                HStack(alignment: .top) {
                    Text("\u{2022}")
                        .accessibilityHidden(true)
                    Text("No \"checked\" / \"unchecked\" state")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                HStack(alignment: .top) {
                    Text("\u{2022}")
                        .accessibilityHidden(true)
                    Text("Unnecessary image announcement")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding([.leading, .trailing])
                HStack(alignment: .top) {
                    Text("\u{2022}")
                        .accessibilityHidden(true)
                    Text("No labelled group in code")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                HStack(alignment: .top) {
                    Text("\u{2022}")
                        .accessibilityHidden(true)
                    Text("No Voice Control or keyboard support")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding([.leading, .trailing])
                Divider()
                    .padding()
                Text("Which gaming platforms do you play?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .font(.title3)
                
                // FIXME: - Replace inaccessible checkboxes with semantic Checkbox (defined below) and add to labelled accessibilityElement(.contain) container
                GenericCheckbox(title: "Nintendo Switch")
                GenericCheckbox(title: "Sony Playstation")
                GenericCheckbox(title: "Microsoft Xbox")
                GenericCheckbox(title: "PC")
            }
        }
        .navigationTitle("Accessible checkbox start")
        .padding(.bottom)
    }
}

// FIXME: - Create custom CheckboxToggleStyle for layout

// FIXME: - Define alt Checkbox component based on native Toggle with custom accessibilityValue and toggleStyle

struct GenericCheckbox: View {
    let title: String
    @State private var isChecked = false

    var body: some View {
        HStack {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 30, height: 30)
            Text(title)
                .font(.title3)
                .accessibilityIdentifier(title)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading)
        .onTapGesture {
            isChecked.toggle()
        }
    }
}

#Preview {
    NavigationStack {
        ToggleCheckboxStartView()
    }
}
