/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct KeyboardEndView: View {
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
                Text("The TextFields below all have keyboardType configured to show different soft keyboards.")
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
                    .autocorrectionDisabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .accessibilityIdentifier("DOBText")
                    .accessibilityLabel("Date of birth, format D D slash M M slash Y Y Y Y")
                    .accessibilityInputLabels(["Date of birth"])
                    .keyboardType(.numbersAndPunctuation)
                // .numbersAndPunctuation shows the numbers and slash (or dash) required for a date
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
                // .URL prioritises the full stop, slash and .com shortcuts
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
                // .numberPad is perfect for positive whole numbers
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
                // .phonePad is useful when you need symbols for international, desk extensions, etc.
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
                // .emailAddress prioritises the "@" and full stop
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
                // Use .decimalPad to capture currency values
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
                // Lots of social platforms use the "@" and "#" prioritised in the .twitter keyboardType
            }
            .navigationTitle("Keyboards end")
        }
    }
}

#Preview {
    NavigationStack {
        KeyboardEndView()
    }
}
