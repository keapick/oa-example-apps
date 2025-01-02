//
//  ContentView.swift
//  OAMacExample
//
//  Created by echo on 12/15/24.
//

import SwiftUI
import SwiftData
import Marketing
import MarketingData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State var text: String = ""

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
                
                Button("Request Device Info") {
                    Task { @MainActor in
                        self.text = await requestDataSummary()
                        print("\(text)")
                    }
                }
            }
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
            .toolbar {
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
    
    func requestDataSummary() async -> String {
        if let string = await MarketingData().jsonSummary(configAllDataCollectionEnabled()) {
            return string
        }
        return ""
    }
    
    func configAllDataCollectionEnabled() -> Config {
        var rules = Config(version: "1.0.0")
        rules.useUserDefaults = true
        rules.includeAppDetails = true
        rules.includeDeviceDetails = true
        rules.includeLocale = true
        rules.includeAttributionToken = false
        rules.includeAppleReceipt = true
        rules.includeNetworkInformation = true
        rules.includeFileCreationDates = true
        rules.includeIDFV = true
        return rules
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
