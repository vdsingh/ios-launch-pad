import SwiftUI

struct {{ModuleName}}View: View {
    var body: some View {
        VStack {
            Text("This is a simple SwiftUI View")
                .font(.subheadline)
        }
    }
}

struct {{ModuleName}}View_Previews: PreviewProvider {
    static var previews: some View {
        {{ModuleName}}View()
    }
}
