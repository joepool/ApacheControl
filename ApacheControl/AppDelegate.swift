//
//  AppDelegate.swift
//  ApacheControl
//
//  Created by Joe Pool on 27/09/2020.
//
import Cocoa
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(withLength: NSStatusItem.squareLength)
        statusBarItem.button?.image = NSImage(named: "MenuBar")

        let statusBarMenu = NSMenu(title: "Cap Status Bar Menu")
        statusBarItem.menu = statusBarMenu

        statusBarMenu.addItem(
            withTitle: "Start Apache",
            action: #selector(AppDelegate.start),
            keyEquivalent: "")

        statusBarMenu.addItem(
            withTitle: "Stop Apache",
            action: #selector(AppDelegate.stop),
            keyEquivalent: "")
        statusBarMenu.addItem(
            withTitle: "Open DIR",
            action: #selector(AppDelegate.dir),
            keyEquivalent: "")
        statusBarMenu.addItem(
            withTitle: "Quit",
            action: #selector(AppDelegate.quit),
            keyEquivalent: "")
    }


    @objc func start() {
        print("Starting Apache")
        let task = Process();
        task.launchPath = "/bin/zsh"
        task.arguments = ["/Applications/ApacheControl.app/Contents/Resources/start.sh"]
        task.launch()

    }
    @objc func stop() {
        print("Showing Desktop Icons")
        let task = Process();
        task.launchPath = "/bin/zsh"
        task.arguments = ["/Applications/ApacheControl.app/Contents/Resources/stop.sh"]
        task.launch()
    }
    @objc func dir(){
        print("Opening Apache Directory")
        NSWorkspace.shared.selectFile(nil, inFileViewerRootedAtPath: "/Library/WebServer/Documents/")
    }
    @IBAction func quit(sender: AnyObject) {
        NSApplication.shared.terminate(self)
    }

}
