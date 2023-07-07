//
//  WebView.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import SwiftUI
import WebKit

struct PostalCodeWebView: UIViewRepresentable {
    @Environment(\.dismiss) private var dismiss
    let urlString: String = "https://chongin12.github.io/Kakao_Postcode/"
    let delegate: WebViewDelegate
    
    func makeUIView(context: Context) -> WKWebView {
        let contentController = WKUserContentController()
        contentController.add(context.coordinator, name: "callBackHandler")
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = contentController
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.navigationDelegate = context.coordinator
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(delegate: delegate, dismiss: dismiss)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler {
        
        let delegate: WebViewDelegate
        let dismiss: DismissAction
        
        init(delegate: WebViewDelegate, dismiss: DismissAction) {
            self.delegate = delegate
            self.dismiss = dismiss
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            delegate.isLoading = true
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            delegate.isLoading = false
        }
        
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            if let data = message.body as? [String: Any] {
                delegate.address = data["roadAddress"] as? String ?? ""
                print("address : \(delegate.address)")
            }
            dismiss()
        }
    }
}

class WebViewDelegate: ObservableObject {
    @Binding var address: String
    @Binding var isLoading: Bool
    
    init(address: Binding<String>, isLoading: Binding<Bool>) {
        self._address = address
        self._isLoading = isLoading
    }
}

struct WebView: UIViewRepresentable {
    var urlString: String
    init(_ urlString: String) {
        self.urlString = urlString
    }
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}


struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView("https://swamp-open-7fc.notion.site/1-d48d06a02a0a4272a7b931d3aa27e138?pvs=4")
    }
}
