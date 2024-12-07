//
//  DataView.swift
//  OASwiftUIExample
//
//  Created by echo on 12/6/24.
//

import SwiftUI

struct DataView: View {
    @Binding var text: String
    
    var body: some View {
        TextEditor(text: $text)
    }
}
