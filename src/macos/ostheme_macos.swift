import Cocoa
import Darwin.C
import Foundation

class Observer {
    func observe() {
        DistributedNotificationCenter.default.addObserver(
            forName: Notification.Name("AppleInterfaceThemeChangedNotification"),
            object: nil,
            queue: nil,
            using: self.interfaceModeChanged
        )
    }
    func interfaceModeChanged(_ notification: Notification) {
        showCurrentMode()
    }
    func showCurrentMode() {
        print(UserDefaults.standard.string(forKey: "AppleInterfaceStyle") ?? "Light")
        fflush(stdout)
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        observer.observe()
    }
}

let observer = Observer.init()
observer.showCurrentMode()
if CommandLine.arguments.contains("--observe") {
    let app = NSApplication.shared
    let delegate = AppDelegate()
    app.delegate = delegate
    app.run()
}
