/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct ResponsiveLayoutStartView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("The account tile below does not have a responsive layout. It ends up wrapping excessively.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("The 3 column table below does not have a responsive layout. The content ends up truncating.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Use the DynamicTypeSize Environment variable to check the current settings and define conditional layouts.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                Text("Unresponsive account tile")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing, .top])
                    .font(.title3)
                    .accessibilityAddTraits(.isHeader)
                UnresponsiveAccountTile()
                Divider()
                    .padding([.leading, .trailing])
                Text("Unresponsive table layout")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .font(.title3)
                    .accessibilityAddTraits(.isHeader)
                UnresponsiveTable()
            }
            .navigationTitle("Responsive layout start")
        }
    }
}

struct UnresponsiveAccountTile : View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.colorScheme) var colorScheme
    @State private var showAccountDetails = false
    @AccessibilityFocusState private var isTileFocused: Bool

    var body : some View {
        // FIXME: - Define a conditional layout for AX* test size settings.
        Button(action: {
            showAccountDetails = true
        }, label: {
            HStack(alignment: .top) {
                Image(systemName: "creditcard")
                    .accessibilityHidden(true)
                // FIXME: - Make Image display conditional on dynamic type size
                VStack(alignment: .leading) {
                    HStack {
                        Text("Personal Account #3333")
                            .font(.title3)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .accessibilityHidden(true)
                    }
                    // FIXME: - Update HStack x 3 below to conditional layout
                    HStack(alignment: .top) {
                        Text("BSB: 111-222")
                        Text("Acc: 11-222-3333")
                            .accessibilityLabel("Account number 1 1, 2 2 2, 3 3 3 3")
                    }
                    HStack(alignment: .top) {
                        Text("Available balance")
                        Spacer()
                        Text("+ $100.00")
                    }
                    HStack(alignment: .top) {
                        Text("Current balance")
                        Spacer()
                        Text("+ $100.00")
                    }
                }
            }
            .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
            .padding()
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 2)
        )
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(colorScheme == .dark ? Color.black : Color.white)
                .shadow(color: .gray, radius: 5, x: 4, y: 4)
        )
        .padding()
        .accessibilityFocused($isTileFocused)
        .accessibilityInputLabels(["Personal account"])
        .alert("Account tile tapped", isPresented: $showAccountDetails) {
            Button("OK", role: .cancel) {
                isTileFocused = true
            }
        }
        .accessibilityHint("View account transaction list")
    }
}

struct UnresponsiveTable : View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize

    var body: some View {
        VStack {
            // FIXME: - Do not display header row for AX* text sizes
            GeometryReader { geometry in
                HStack {
                    Text("Flight")
                        .fontWeight(.bold)
                        .frame(width: geometry.size.width / 5, alignment: .leading)
                    Text("From")
                        .fontWeight(.bold)
                        .frame(width: geometry.size.width / 3, alignment: .leading)
                    Text("To")
                        .fontWeight(.bold)
                        .frame(width: geometry.size.width / 3, alignment: .leading)
                }
                .accessibilityHidden(true)
            }
            .padding(.bottom)
            ForEach(flights) { flight in
                // FIXME: - Define an alternate layout for AX* text sizes
                GeometryReader { geometry in
                    HStack {
                        Text(flight.flightNum)
                            .frame(width: geometry.size.width / 5, alignment: .leading)
                            .accessibilityLabel("Flight \(flight.flightNum)")
                        Text(flight.startPoint)
                            .frame(width: geometry.size.width / 3, alignment: .leading)
                            .accessibilityLabel("From \(flight.startPoint)")
                        Text(flight.endPoint)
                            .frame(width: geometry.size.width / 3, alignment: .leading)
                            .accessibilityLabel("To \(flight.endPoint)")
                    }
                }
                .padding(.bottom)
            }
        }
        .padding(.leading)
    }
}

#Preview {
    NavigationStack {
        ResponsiveLayoutStartView()
    }
}
