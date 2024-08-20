/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct AutofillStartView: View {
    @State private var dateOfBirth = ""
    @State private var addressLine1 = ""
    @State private var username = ""
    @State private var phoneNum = ""
    @State private var email = ""
    @State private var creditCardNum = ""
    @State private var oneTimeCode = ""

    var body: some View {
        ScrollView {
            VStack {
                Text("The TextFields below do not support autofill.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("Configuring TextFields to reuse existing data can reduce effort and errors.")
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
                    // FIXME: - Add textContentType to match data being collected
                TextFieldLabel(label: "Address line 1")
                TextField("", text: $addressLine1)
                    .border(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title3)
                    .autocorrectionDisabled(true)
                    .accessibilityIdentifier("AddressLine1Text")
                    .accessibilityLabel("Address line 1")
                    .keyboardType(.default)
                // FIXME: - Add textContentType to match data being collected
                TextFieldLabel(label: "User name")
                TextField("", text: $username)
                    .border(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title3)
                    .autocorrectionDisabled(true)
                    .accessibilityIdentifier("UserNameText")
                    .accessibilityLabel("User name")
                    .keyboardType(.default)
                // FIXME: - Add textContentType to match data being collected
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
                // FIXME: - Add textContentType to match data being collected
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
                // FIXME: - Add textContentType to match data being collected
                TextFieldLabel(label: "Credit card number")
                TextField("", text: $creditCardNum)
                    .border(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title3)
                    .autocorrectionDisabled(true)
                    .accessibilityIdentifier("CCNumberText")
                    .accessibilityLabel("Credit card number")
                    .keyboardType(.numberPad)
                // FIXME: - Add textContentType to match data being collected
                TextFieldLabel(label: "Passcode")
                TextField("", text: $oneTimeCode)
                    .border(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title3)
                    .autocorrectionDisabled(true)
                    .accessibilityIdentifier("PasscodeText")
                    .accessibilityLabel("Passcode")
                    .keyboardType(.numberPad)
                // FIXME: - Add textContentType to match data being collected
            }
            .navigationTitle("Autofill start")
        }
    }
}

#Preview {
    NavigationStack {
        AutofillStartView()
    }
}
