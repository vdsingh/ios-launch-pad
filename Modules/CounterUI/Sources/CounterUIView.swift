import SwiftUI

public struct CounterUIView: View {
    @State private var count = 0

    public init() {}

    public var body: some View {
        VStack {
            Text("Counter: \(count)")
                .font(.headline)
            
            HStack {
                Button("-") {
                    count -= 1
                }
                .font(.title)
                .padding()
                
                Button("+") {
                    count += 1
                }
                .font(.title)
                .padding()
            }
        }
    }
}

struct CounterUIView_Previews: PreviewProvider {
    static var previews: some View {
        CounterUIView()
    }
}
