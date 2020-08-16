//
//  ResultStringViewModelTests.swift
//  CodeTestTests
//
//  Created by Farzana Sultana on 8/16/20.
//  Copyright © 2020 Self. All rights reserved.
//

import Foundation
import XCTest

class ResultStringViewModelTests: XCTestCase {

    func testSuccessFetchData() {
        
        let expectedString = ResultString.with().requiredString
        let service = MockService(mockData: expectedString)
        
        let viewModel = ResultStringViewModel(service:service)
        
        
        viewModel.loadData()
        
        XCTAssertTrue(!viewModel.loading)
        //XCTAssertEqual(!viewModel.resultStrings.requiredString.count, 1)
    }
}
