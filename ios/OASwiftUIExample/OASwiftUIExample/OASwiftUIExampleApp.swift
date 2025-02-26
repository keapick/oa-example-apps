//
//  OASwiftUIExampleApp.swift
//  OASwiftUIExample
//
//  Created by echo on 12/4/24.
//

import SwiftUI
import Marketing

@main
struct OASwiftUIExampleApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in                    
                    Logger.shared.logDebug(message: "onOpenURL: \(url)")
                })
        }
    }
}
