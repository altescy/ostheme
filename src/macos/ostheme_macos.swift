import Foundation
import Cocoa
import Darwin.C

func showCurrentMode() {
    print(UserDefaults.standard.string(forKey: "AppleInterfaceStyle") ?? "Light")
    fflush(stdout)
}

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
}

let app = NSApplication.shared
let observer = Observer.init()

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        observer.observe()
    }
}

showCurrentMode()
if CommandLine.arguments.contains("--observe") {
    let delegate = AppDelegate()
    app.delegate = delegate
    app.run()
}
