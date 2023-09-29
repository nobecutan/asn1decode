//
//  ViewController.swift
//  asn1decode
//
//  Created by Christof Rath on 12.08.21.
//

import Cocoa
import WebKit

class ViewController: NSViewController, WKUIDelegate {

    var webView: WKWebView!
    var docToLoad: String!

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration ();
        webConfiguration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs");
        webView = WKWebView (frame: CGRect(x:0, y:0, width:1200, height:800), configuration:webConfiguration);
        webView.uiDelegate = self ;
        view = webView;
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = Bundle.main.url(forResource: "index" , withExtension: "html" , subdirectory: "asn1js") {
            let path = url.deletingLastPathComponent();
            self.webView.loadFileURL(url , allowingReadAccessTo: path);
            self.view = webView;
            self.webView.evaluateJavaScript("document.getElementById('wantHex').checked=false;document.getElementById('trimHex').checked=false;");
            if docToLoad != nil {
                self.webView.evaluateJavaScript("document.read('" + docToLoad + "');")
            }
        }
    }

}

