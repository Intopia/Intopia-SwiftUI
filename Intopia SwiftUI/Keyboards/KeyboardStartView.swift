/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct KeyboardStartView: View {
    @State private var dateOfBirth = ""
    @State private var webAddress = ""
    @State private var age = ""
    @State private var phoneNum = ""
    @State private var email = ""
    @State private var amount = ""
    @State private var socialHandle = ""

    var body: some View {
        ScrollView {
            VStack {
                Text("The TextFields below all use the default soft keyboard.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("Configuring TextFields to use a keyboard that reflects the expected data can reduce effort and errors.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Divider()
                    .padding()
                TextFieldLabel(label: "Date of birth (DD/MM/YYYY)")
                TextField("", text: $dateOfBirth)
                    .border(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title3)
                    .autocorrectionDisabled(true)
                    .accessibilityLabel("Date of birth, format D D slash M M slash Y Y Y Y")
                    .accessibilityInputLabels(["Date of birth"])
                    .keyboardType(.numbersAndPunctuation)
                    .accessibilityIdentifier("DOBText")
                TextFieldLabel(label: "Web address")
                TextField("", text: $webAddress)
                    .border(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title3)
                    .autocorrectionDisabled(true)
                    .accessibilityIdentifier("WebAddressText")
                    .accessibilityLabel("Web address")
                    .keyboardType(.URL)
                TextFieldLabel(label: "Age")
                TextField("", text: $age)
                    .border(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title3)
                    .autocorrectionDisabled(true)
                    .accessibilityIdentifier("AgeText")
                    .accessibilityLabel("Age")
                    .keyboardType(.numberPad)
                TextFieldLabel(label: "Phone number")
                TextField("", text: $phoneNum)
                    .border(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title3)
                    .autocorrectionDisabled(true)
                    .accessibilityIdentifier("PhoneText")
                    .accessibilityLabel("Phone number")
                    .keyboardType(.phonePad)
                TextFieldLabel(label: "Email")
                TextField("", text: $email)
                    .border(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title3)
                    .autocorrectionDisabled(true)
                    .accessibilityIdentifier("EmailText")
                    .accessibilityLabel("Email")
                    .keyboardType(.emailAddress)
                TextFieldLabel(label: "Amount")
                TextField("", text: $amount)
                    .border(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title3)
                    .autocorrectionDisabled(true)
                    .accessibilityIdentifier("AmountText")
                    .accessibilityLabel("Amount")
                    .keyboardType(.decimalPad)
                TextFieldLabel(label: "Social handle")
                TextField("", text: $socialHandle)
                    .border(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title3)
                    .autocorrectionDisabled(true)
                    .accessibilityIdentifier("SocialText")
                    .accessibilityLabel("Social handle")
                    .keyboardType(.twitter)
            }
            .navigationTitle("Keyboards start")
        }
    }
}

struct TextFieldLabel : View {
    let label: String
    
    var body: some View {
        Text(label)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .trailing])
            .font(.title3)
    }
}

#Preview {
    NavigationStack {
        KeyboardStartView()
    }
}
