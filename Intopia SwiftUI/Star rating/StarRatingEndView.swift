/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct StarRatingEndView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Use accessibilityLabel when an element doesn't have a meaningful label in code.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("Use the Accessibility Inspector to check an element's label.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Be careful that a custom accessibilityLabel doesn't unintentionally impact the Voice Control experience")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                Text("Rate my restaurant")
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                StarRatingEnd(rating: 0, label: "Rate my restaurant")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
            }
            .navigationTitle("Star rating widget end")
        }
    }
}

struct StarRatingEnd : View {
    @State var rating: Int
    var label: String
    // Capturing widget label
    
    var body: some View {
        HStack {
            ForEach(0 ..< 5) { index in
                Button {
                    rating = index + 1
                } label: {
                    Image(systemName: (index >= rating ? "star" : "star.fill"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40)
                        .foregroundStyle(index >= rating ? .black : .green)
                }
            }
        }
        .accessibilityRepresentation {
            Stepper(label, value: $rating, in: 0...5, step: 1)
                .accessibilityIdentifier("StarRatingStepper")
        }
        // accessibilityRepresentation conceptually substitutes in the labelled, accessible, contextual experience of a Stepper in place of the unlabelled, ungrouped buttons for assistive tech users.
    }
}

#Preview {
    NavigationStack {
        StarRatingEndView()
    }
}
