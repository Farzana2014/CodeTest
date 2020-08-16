//
//  ResultStringTests.swift
//  CodeTestTests
//
//  Created by Farzana Sultana on 8/16/20.
//  Copyright © 2020 Self. All rights reserved.
//

import XCTest
import Foundation

class ResultStringTests: XCTestCase {

    var testString: String!

    override func setUp() {
        testString = "<html><body><h1 style=\"color:red;\">html text here</h1></body></html>"
    }

    override func tearDown() {
        testString = nil
    }
    
    func testSuccessParser() {
        
        guard let stringData = testString.data(using: .utf8) else { return }
        
        let allStrings = String(data: stringData, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        XCTAssertNotNil(allStrings)
        XCTAssertEqual(allStrings, ResultString.with().requiredString)
    }

}

