//
//  ViewController.swift
//  TestWeb
//
//  Created by chiahsun.tung on 2022/04/22.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let pre = WKPreferences()
        pre.javaScriptCanOpenWindowsAutomatically = true
        let config = WKWebViewConfiguration()
        config.preferences = pre
        webview = WKWebView(frame: .zero, configuration: config)
        webview.uiDelegate = self
        webview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(webview)

        NSLayoutConstraint.activate([
            webview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webview.topAnchor.constraint(equalTo: view.topAnchor),
            webview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        webview.load(URLRequest.init(url: URL(string: "https://www.google.com")!))
    }

    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        let webview = WKWebView(frame: .zero, configuration: configuration)
        webview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(webview)

        NSLayoutConstraint.activate([
            webview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webview.topAnchor.constraint(equalTo: view.topAnchor),
            webview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return webview
    }
}

