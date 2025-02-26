//
//  WebView.swift
//  MyBrowser
//
//  Created by echo on 2/12/25.
//
import Foundation
import SwiftUI
import Combine
@preconcurrency import WebKit

struct MyWebView: UIViewRepresentable {
    
    // Use combine to pass along SwiftUI button presses
    @State var goBack: PassthroughSubject<Bool, Never>
    @State var cancellable: AnyCancellable? = nil
    
    let navigationDelegate = MyNavigationDelegate()
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        webView.navigationDelegate = navigationDelegate as WKNavigationDelegate
        if let url = URL(string: "https://www.ieesizaq.com/oat") {
            webView.load(URLRequest(url: url))
        }
        
        // setup combine sink
        DispatchQueue.main.async {
            self.cancellable = goBack.sink { (value) in
                webView.goBack()
            }
        }
        
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

// Disables Universal Links and allows schemes
class MyNavigationDelegate: NSObject, WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        if let url = navigationAction.request.url, let scheme = url.scheme {
            if scheme == "https" || scheme == "http" {
                // 3 is the private value for no universal links
                decisionHandler(WKNavigationActionPolicy(rawValue: WKNavigationActionPolicy.allow.rawValue + 2)!)
            } else {
                
                // assume it's a scheme for an app and attempt open
                UIApplication.shared.open(url)
                decisionHandler(.cancel)
            }
        }
    }
}

