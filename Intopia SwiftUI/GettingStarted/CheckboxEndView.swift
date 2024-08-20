/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI


struct CheckboxEndView: View {

    var body: some View {
        ScrollView {
            VStack {
                Text("These checkboxes are built from generic elements (Image + Text) but have meaningful accessibility semantics applied.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                HStack(alignment: .top) {
                    Text("\u{2022}")
                        .accessibilityHidden(true)
                    Text("Trait = isToggle")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding([.leading, .trailing])
                HStack(alignment: .top) {
                    Text("\u{2022}")
                        .accessibilityHidden(true)
                    Text("Image hidden from assistive technologies")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                HStack(alignment: .top) {
                    Text("\u{2022}")
                        .accessibilityHidden(true)
                    Text("Custom accessibilityValues \"checked\" and \"unchecked\"")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding([.leading, .trailing])
                HStack(alignment: .top) {
                    Text("\u{2022}")
                        .accessibilityHidden(true)
                    Text("Labelled group defined in code")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                HStack(alignment: .top) {
                    Text("\u{2022}")
                        .accessibilityHidden(true)
                    Text("Voice Control & keyboard support")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding([.leading, .trailing])
                Divider()
                    .padding()
                Text("How do you get around?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .font(.title3)
                VStack {
                    EndCheckbox(title: "Walking")
                    EndCheckbox(title: "Bicycle")
                    EndCheckbox(title: "Scooter")
                    EndCheckbox(title: "Public transport")
                    EndCheckbox(title: "Car")
                    EndCheckbox(title: "Other")
                }
                .accessibilityElement(children: .contain)
                .accessibilityLabel("How do you get around?")
                // Accessibility-labelled group container
            }

        }
        .navigationTitle("Checkbox end state")
        .padding(.bottom)
    }
}

// MARK: - Checkbox

struct EndCheckbox: View {
    let title: String
    @State private var isChecked = false

    var body: some View {
        HStack {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 30, height: 30)
                .accessibilityHidden(true)
                // Unlabelled image hidden from assistive technologies
            Text(title)
                .font(.title3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading)
        .onTapGesture {
            isChecked.toggle()
        }
        .accessibilityAddTraits(.isToggle)
        .accessibilityValue(isChecked ? "checked" : "unchecked")
        .accessibilityLabel(title)
        // Trait, label and custom accessibilityValues applied
        .accessibilityIdentifier(title)
        .accessibilityRemoveTraits(.isStaticText)
    }
}

#Preview {
    NavigationStack {
        CheckboxEndView()
    }
}
