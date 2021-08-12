//
//  ViewController.swift
//  asn1decode
//
//  Created by Christof Rath on 12.08.21.
//

import Cocoa
import WebKit


class ViewController: NSViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        if let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "asn1js") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url {
            if url.scheme != "file" {
                NSWorkspace.shared.open(url)
                decisionHandler(.cancel)
                return
            }
        }

        decisionHandler(.allow)
    }
}

