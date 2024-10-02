import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            SearchTextField() // Custom text field for searching
        }
        .frame(width: 400, height: 75)
        .background(VisualEffectView(material: .hudWindow, blendingMode: .behindWindow))
        .cornerRadius(30) // Rounded corners
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} 
