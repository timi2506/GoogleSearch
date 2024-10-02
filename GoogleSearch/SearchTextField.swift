import SwiftUI

struct SearchTextField: NSViewRepresentable {
    class Coordinator: NSObject, NSTextFieldDelegate {
        var parent: SearchTextField

        init(_ parent: SearchTextField) {
            self.parent = parent
        }

        func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
            if commandSelector == #selector(NSResponder.insertNewline(_:)) {
                let searchString = control.stringValue
                if let encodedSearch = searchString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                   let url = URL(string: "https://www.google.com/search?q=\(encodedSearch)") {
                    NSWorkspace.shared.open(url)
                    NSApp.terminate(nil) // Close the app after searching
                }
                return true
            }
            return false
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func makeNSView(context: Context) -> NSTextField {
        let textField = NSTextField()
        textField.placeholderString = "Type and hit Enter to search Google"
        textField.isBordered = false
        textField.font = NSFont.systemFont(ofSize: 18)
        textField.backgroundColor = NSColor.clear // Clear background
        textField.textColor = NSColor.white // Text color to match background
        textField.focusRingType = .none
        textField.delegate = context.coordinator
        textField.alignment = .center
        return textField
    }

    func updateNSView(_ nsView: NSTextField, context: Context) {
        // No updates needed
    }
}
