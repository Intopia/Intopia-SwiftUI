/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("This is the companion app to the training course **Accessibility for iOS developers** by Intopia.")
                }
                Section(content: {
                    NavigationLink(destination: GettingStartedView()) {
                        Text("Getting started with accessibility")
                    }
                    NavigationLink(destination: AccessibleNamesView()) {
                        Text("Accessible names")
                    }
                    NavigationLink(destination: AccessibleDescriptionsView()) {
                        Text("Accessible descriptions")
                    }
                    NavigationLink(destination: AccessibleUsageInstructionsView()) {
                        Text("Accessible usage instructions")
                    }
                    NavigationLink(destination: AccessibilityTraitsView()) {
                        Text("Accessibility traits")
                    }
                    NavigationLink(destination: ImagesView()) {
                        Text("Images")
                    }
                    NavigationLink(destination: TablesView()) {
                        Text("Tables")
                    }
                    NavigationLink(destination: GroupsView()) {
                        Text("Groups")
                    }
                    NavigationLink(destination: InstructionsView()) {
                        Text("Instructions")
                    }
                    NavigationLink(destination: KeyboardsView()) {
                        Text("Keyboards")
                    }
                    NavigationLink(destination: AutofillView()) {
                        Text("Text field autofill")
                    }
                    NavigationLink(destination: LiveRegionsView()) {
                        Text("Live regions")
                    }
                    NavigationLink(destination: CheckboxesView()) {
                        Text("Checkboxes")
                    }
                    NavigationLink(destination: StarRatingView()) {
                        Text("Star rating widget")
                    }
                    NavigationLink(destination: LayoutView()) {
                        Text("Layout")
                    }
                }, header: {
                    Text("Activities")
                })
                Section(content: {
                    NavigationLink(destination: AboutView()) {
                        Text("About this app")
                    }
                }, header: {
                    Text("About")
                })
            }
            .listStyle(.insetGrouped)
            .navigationTitle("SwiftUI accessibility")
        }
    }
}

#Preview {
    ContentView()
}
