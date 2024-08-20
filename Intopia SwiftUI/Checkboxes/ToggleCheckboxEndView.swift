/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct ToggleCheckboxEndView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("The checkboxes are based on the native Toggle component.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("VoiceOver says \"toggle switch\" and \"double-tap to toggle\" which is native (read: familiar) behaviour")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("The checkbox looks different from the native toggle, and VoiceOver says \"checked\" and \"unchecked\" instead of \"on\" and \"off\" to better match the mental model of a checkbox.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                Text("Which gaming platforms do you play?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .font(.title3)
                VStack {
                    Checkbox(isChecked: false, label: "Nintendo Switch")
                    Checkbox(isChecked: false, label: "Sony Playstation")
                    Checkbox(isChecked: false, label: "Microsoft Xbox")
                    Checkbox(isChecked: false, label: "PC")
                }
                .accessibilityElement(children: .contain)
                .accessibilityLabel("Which gaming platforms do you play?")
            }
            .navigationTitle("Accessible checkbox end")
        }
    }
}

struct Checkbox: View {
    @State var isChecked: Bool
    @State var label: String
    
    var body: some View {
        Toggle(isOn: $isChecked) {
            Text(label)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title3)
        }
        .padding([.leading, .trailing])
        .toggleStyle(CheckboxToggleStyle())
        .accessibilityValue(isChecked ? "checked" : "unchecked")
        .accessibilityRemoveTraits(.isButton)
        .accessibilityIdentifier(label)
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 30, height: 30)
            configuration.label
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .onTapGesture {
            configuration.isOn.toggle()
        }
    }
}

#Preview {
    NavigationStack {
        ToggleCheckboxEndView()
    }
}
