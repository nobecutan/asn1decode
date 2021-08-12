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

    func application(_ sender: NSApplication, openFile filename: String) -> Bool {
            
        print ("File open func called!" + filename);
        
        let rootViewController = NSApplication.shared.mainWindow?.windowController?.contentViewController as! ViewController
        webView = rootViewController.webView
        webView.evaluateJavaScript("document.read('" + filename + "')", completionHandler: nil)
        return true
    }


}

