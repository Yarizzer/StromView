//
//  AppDelegate.swift
//  StormView
//
//  Created by Yaroslav Abaturov on 19.06.2023.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet private var window: NSWindow!

    private var router: AppRoutable?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        router = AppRouter()
        routeToInitialScene()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    private func routeToInitialScene() {
        window.contentViewController = self.router?.getInitialScene()
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
