//
//  DebugView.swift
//  OASwiftUIExample
//
//  Created by echo on 2/21/25.
//

import SwiftUI
import Marketing

struct DebugView: View {
    
    @ObservedObject private var logWrapper = LoggerSwiftUI()
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button("Clear") {
                        logWrapper.removalAll()
                    }
                    .padding(.all, 5)
                    .border(.black)
                }
                TextEditor(text: $logWrapper.text)
                    .padding()
            }
        }
    }
    
}

#Preview {
    DebugView()
}
