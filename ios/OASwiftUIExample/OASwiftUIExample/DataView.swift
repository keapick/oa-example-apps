//
//  DataView.swift
//  OASwiftUIExample
//
//  Created by echo on 12/6/24.
//

import SwiftUI
import Marketing
import MarketingData
import MarketingDataIDFA
import AppTrackingTransparency

struct DataView: View {
    @State var text: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Button("Device Info") {
                    Task { @MainActor in
                        self.text = await requestDataSummary()
                    }
                }
                .padding(.all, 5)
                .border(.black)

                Button("Request ATT") {
                    Task { @MainActor in
                        await AppTrackingTransparency.ATTrackingManager.requestTrackingAuthorization()
                    }
                }
                .padding(.all, 5)
                .border(.black)
                
                Button("Resolve Link") {
                    Task { @MainActor in
                        try await LinkResolution().resolveWithDub("https://dub.sh/ieesizaq1")
                    }
                }
                .padding(.all, 5)
                .border(.black)
            }
            TextEditor(text: $text)
                .padding()
        }
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
    DataView()
}
