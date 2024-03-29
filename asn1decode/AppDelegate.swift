//
//  AppDelegate.swift
//  asn1decode
//
//  Created by Christof Rath on 12.08.21.
//

import Cocoa
import WebKit

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var webView: WKWebView!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    func application(_ sender: NSApplication, openFile filename: String) -> Bool {
        print ("File open func called!" + filename);
        
        let rootViewController = NSApplication.shared.mainWindow?.windowController?.contentViewController as! ViewController
        rootViewController.docToLoad = filename
        return true
    }

}

