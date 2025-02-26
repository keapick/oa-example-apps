//
//  ContentView.swift
//  MyBrowser
//
//  Created by echo on 2/12/25.
//

import SwiftUI
import Combine
import WebKit

struct ContentView: View {
    // Use combine to pass button presses to the underlying UIKit webview
    @State var goBack = PassthroughSubject<Bool, Never>()
    
    var body: some View {
        NavigationView {
            VStack {
                MyWebView(goBack: goBack)
            }
            .padding()
            .toolbar {
                Button("Back") {
                    self.goBack.send(true)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
