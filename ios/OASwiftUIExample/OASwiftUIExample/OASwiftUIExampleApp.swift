//
//  OASwiftUIExampleApp.swift
//  OASwiftUIExample
//
//  Created by echo on 12/4/24.
//

import SwiftUI

@main
struct OASwiftUIExampleApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                    print("Link: \(url)")
                })
        }
    }
    
}
