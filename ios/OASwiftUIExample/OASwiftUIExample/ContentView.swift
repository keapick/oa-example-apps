//
//  ContentView.swift
//  OASwiftUIExample
//
//  Created by echo on 12/4/24.
//

import SwiftUI
import Marketing
import MarketingData
import MarketingDataIDFA
import AppTrackingTransparency

struct ContentView: View {
    
    @State var text: String = ""
        
    var body: some View {
        VStack {
            HStack {
                Button("Request ATT Permission") {
                    Task { @MainActor in
                        await AppTrackingTransparency.ATTrackingManager.requestTrackingAuthorization()
                    }
                }
                Spacer()
            }
            HStack {
                Button("Request Device Info") {
                    Task { @MainActor in
                        self.text = await requestDataSummary()
                    }
                }
                Spacer()
            }
            DataView(text: $text)
        }
        .padding()
    }
    
    func requestDataSummary() async -> String {
        if let string = await MarketingData(idfaSource: IDFACollector()).jsonSummary(configAllDataCollectionEnabled()) {
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
}
