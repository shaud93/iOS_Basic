//
//  WebView.swift
//  Swifty
//
//  Created by D'Ante Watson on 11/7/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()    }
    
    func updateUIView(_ WebView: WKWebView, context: Context) {
        guard let url = URL(string: "https://www.imdb.com/title/tt2861424/") else {return}
        let request = URLRequest(url: url)
        WebView.load(request)
    }
    
    typealias UIViewType = WKWebView
    
    
    
}

#Preview {
    WebView()
}
