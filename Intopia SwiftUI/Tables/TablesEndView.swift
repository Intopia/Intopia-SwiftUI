/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct TablesEndView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("SwiftUI limits semantic Table display to one column on iPhone, so it can't be used for multi-column data tables.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("Instead, use generic containers with accessibilityLabel or accessibilityValue to craft a contextual announcement for each table data cell")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Use dynamicTypeSetting to change layout to avoid text crunch.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                Text("Intopia Sky flights with accessibilityLabel")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                AccessibilityLabelTable()
                Divider()
                    .padding([.leading, .trailing])
                Text("Intopia Sky flights with accessibilityValue")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                AccessibilityValueTable()
            }
        }
        .navigationTitle("Data tables end")
    }
}

struct AccessibilityLabelTable : View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize

    var body: some View {
        VStack {
            if (dynamicTypeSize <= DynamicTypeSize.xxxLarge) {
                GeometryReader { geometry in
                    HStack {
                        Text("Flight")
                            .accessibilityIdentifier("FixedLabelHeader")
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
            }
            ForEach(flights) { flight in
                if (dynamicTypeSize <= DynamicTypeSize.xxxLarge) {
                    GeometryReader { geometry in
                        HStack {
                            Text(flight.flightNum)
                                .frame(width: geometry.size.width / 5, alignment: .leading)
                                .accessibilityIdentifier("DefaultLabelFlightNum")
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
                } else {
                    Text("Flight: \(flight.flightNum)")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .accessibilityIdentifier("BigLabelFlightNum")
                        .accessibilityAddTraits(.isHeader)
                    Text("From: \(flight.startPoint)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("To: \(flight.endPoint)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom)
                }
            }
        }
        .padding(.leading)
    }
}

struct AccessibilityValueTable : View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize

    var body: some View {
        VStack {
            if (dynamicTypeSize <= DynamicTypeSize.xxxLarge) {
                GeometryReader { geometry in
                    HStack {
                        Text("Flight")
                            .fontWeight(.bold)
                            .frame(width: geometry.size.width / 5, alignment: .leading)
                            .accessibilityIdentifier("FixedValueHeader")
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
            }
            ForEach(flights) { flight in
                if (dynamicTypeSize <= DynamicTypeSize.xxxLarge) {
                    GeometryReader { geometry in
                        HStack {
                            Text(flight.flightNum)
                                .frame(width: geometry.size.width / 5, alignment: .leading)
                                .accessibilityIdentifier("DefaultValueFlightNum")
                                .accessibilityValue("Flight")
                            Text(flight.startPoint)
                                .frame(width: geometry.size.width / 3, alignment: .leading)
                                .accessibilityValue("From")
                            Text(flight.endPoint)
                                .frame(width: geometry.size.width / 3, alignment: .leading)
                                .accessibilityValue("To")
                        }
                    }
                    .padding(.bottom)
                } else {
                    Text("Flight: \(flight.flightNum)")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .accessibilityIdentifier("BigValueFlightNum")
                        .accessibilityAddTraits(.isHeader)
                    Text("From: \(flight.startPoint)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("To: \(flight.endPoint)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom)
                }
            }
        }
        .padding(.leading)
    }
}

#Preview {
    NavigationStack {
        TablesEndView()
    }
}
