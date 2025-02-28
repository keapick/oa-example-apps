//
//  LinkResolutionTests.swift
//  MarketingTests
//
//  Created by echo on 2/26/25.
//

import Testing
@testable import Marketing

// integration tests against a local dub server
// requires a host app that allows http calls
struct LinkResolutionIntegrationTests {

    @Test func helloWorld() async throws {
        //try await LinkResolution.shared.resolveLinkWithDub("https://www.dub.co")
    }

}
