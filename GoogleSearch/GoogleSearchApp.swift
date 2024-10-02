import SwiftUI

@main
struct ProjectNameApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(width: 400, height: 75)
                .background(Color.clear)
        }
        .windowStyle(HiddenTitleBarWindowStyle()) // Hide title bar
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        if let window = NSApplication.shared.windows.first {
            window.isOpaque = false
            window.backgroundColor = NSColor.clear
            window.styleMask = [.borderless]
            window.level = .floating
            window.isMovableByWindowBackground = true
            window.titlebarAppearsTransparent = true
            window.standardWindowButton(.closeButton)?.isHidden = true
            window.standardWindowButton(.miniaturizeButton)?.isHidden = true
            window.standardWindowButton(.zoomButton)?.isHidden = true
        }
    }
}
