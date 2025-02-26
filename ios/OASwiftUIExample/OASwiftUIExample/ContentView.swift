//
//  ContentView.swift
//  OASwiftUIExample
//
//  Created by echo on 12/4/24.
//

import SwiftUI

struct ContentView: View {
            
    var body: some View {
        TabView {
            Tab {
                DataView()
            } label: {
                Text("Data")
            }
            Tab {
                DebugView()
            } label: {
                Text("Debug")
            }
        }
    }

}

#Preview {
    ContentView()
}
