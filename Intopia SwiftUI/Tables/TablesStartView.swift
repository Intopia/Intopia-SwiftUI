/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct TablesStartView: View {
    // FIXME: - Add a reference to the DynamicTypeSize Environment variable
    
    var body: some View {
        ScrollView {
            VStack {
                Text("The data table below is built from generic containers")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("VoiceOver users aren't told about data relationships like row and column headers")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Table data gets crunched at larger text size settings")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                Text("Intopia Sky flight list")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                VStack {
                    // FIXME: - Only display this header row when the dynamicTypeSize is in the regular text range
                    GeometryReader { geometry in
                        HStack {
                            Text("Flight")
                                .fontWeight(.bold)
                                .frame(width: geometry.size.width / 5, alignment: .leading)
                                .accessibilityIdentifier("FixedHeader")
                            Text("From")
                                .fontWeight(.bold)
                                .frame(width: geometry.size.width / 3, alignment: .leading)
                            Text("To")
                                .fontWeight(.bold)
                                .frame(width: geometry.size.width / 3, alignment: .leading)
                        }
                    }
                    .padding(.bottom)
                    ForEach(flights) { flight in
                        // FIXME: - Add a DynamicTypeSize check and an alternate VStack layout for accessibility text sizes
                        GeometryReader { geometry in
                            HStack {
                                Text(flight.flightNum)
                                    .frame(width: geometry.size.width / 5, alignment: .leading)
                                    .accessibilityIdentifier("PlainFlightNum")
                                    // FIXME: - Add first column data cell header context with accessibilityLabel or accessibilityValue
                                Text(flight.startPoint)
                                    .frame(width: geometry.size.width / 3, alignment: .leading)
                                    // FIXME: - Add second column data cell header context with accessibilityLabel or accessibilityValue
                                Text(flight.endPoint)
                                    .frame(width: geometry.size.width / 3, alignment: .leading)
                                    // FIXME: - Add third column data cell header context with accessibilityLabel or accessibilityValue
                            }
                        }
                        .padding(.bottom)
                    }
                }
                .padding(.leading)
            }
            .navigationTitle("Data tables start")
        }
    }
}

#Preview {
    NavigationStack {
        TablesStartView()
    }
}
