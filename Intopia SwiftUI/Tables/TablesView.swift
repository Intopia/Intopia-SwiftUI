/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct TablesView: View {
    var body: some View {
        List {
            Text("Using Table markup")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.top)
            NavigationLink(destination: TablesStartView()) {
                Text("Data tables start state")
            }
            NavigationLink(destination: TablesEndView()) {
                Text("Data tables end state")
            }
        }
        .navigationTitle("Tables")
    }
}

struct Flight: Identifiable {
    let flightNum: String
    let startPoint: String
    let endPoint: String
    let id = UUID()
}

var flights = [
    Flight(flightNum: "IS1234", startPoint: "Melbourne", endPoint: "Sydney"),
    Flight(flightNum: "IS4321", startPoint: "Sydney", endPoint: "Melbourne"),
    Flight(flightNum: "IS7890", startPoint: "Melbourne", endPoint: "Perth"),
    Flight(flightNum: "IS0987", startPoint: "Perth", endPoint: "Melbourne"),
    Flight(flightNum: "IS4567", startPoint: "Melbourne", endPoint: "Cairns"),
    Flight(flightNum: "IS7654", startPoint: "Cairns", endPoint: "Melbourne")
]

#Preview {
    NavigationStack {
        TablesView()
    }
}
