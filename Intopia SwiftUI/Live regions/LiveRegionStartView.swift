/*
 Copyright (c) 2024 Intopia Pty Ltd

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct LiveRegionStartView: View {
    @State private var startTime = Date()
    @State private var elapsed: TimeInterval = 0
    private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private var timestring: String {
        let minutes = Int(elapsed) / 60 % 60
        let seconds = Int(elapsed) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private var timea11ystring: String {
        let minutes = Int(elapsed) / 60 % 60
        let seconds = Int(elapsed) % 60
        return String(format: "%02d minutes, %02d seconds", minutes, seconds)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("The timer below updates every second but VoiceOver doesn't give any updates.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Text("Users must keep re-focussing the timer to hear the latest value")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                Text("Use the UpdatesFrequently trait to prompt VoiceOver to listen for and announce updates.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Divider()
                    .padding([.leading, .trailing])
                Text("My timer - tap to restart")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .font(.title3)
                Text(timestring)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                    .font(.title3)
                    .onReceive(timer) { _ in
                        elapsed = Date().timeIntervalSince(startTime)
                    }
                    .onTapGesture {
                        startTime = Date()
                        elapsed = 0
                    }
                    .accessibilityIdentifier("TimerText")
                    .accessibilityLabel(timea11ystring)
                    .accessibilityInputLabels(["Restart timer"])
                // FIXME: - Enable live VoiceOver updates
            }
            .navigationTitle("Live region start")
        }
    }
}

#Preview {
    NavigationStack {
        LiveRegionStartView()
    }
}
