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
    
    
    var expectedString: String!
    var service: MockService!
    var viewModel: ResultStringViewModel!
    
    override func setUp() {
        expectedString = ResultString.with().requiredString
        service = MockService(mockData: expectedString)
        viewModel = ResultStringViewModel(service: service)
    }
    
    override func tearDown() {
        expectedString = nil
        service = nil
        viewModel =  nil
    }
    
    
    func testSuccessFetchData() {
        
        viewModel.loadData()
        
        XCTAssertTrue(!viewModel.loading)
        XCTAssertEqual(viewModel.resultStrings.requiredString.count, 68)
    }
    
        func testEmptyData() {

            expectedString = ""
            service = MockService(mockData: expectedString)
            viewModel = ResultStringViewModel(service: service)
            
            viewModel.loadData()
    
            XCTAssertTrue(!viewModel.loading)
            XCTAssertEqual(viewModel.resultStrings.requiredString.count, 0)
        }
    
        func testNilData() {
            
            expectedString = nil
            service = MockService(mockData: expectedString)
            viewModel = ResultStringViewModel(service: service)
    
            viewModel.loadData()
    
            XCTAssertTrue(!viewModel.loading)
            XCTAssertEqual(viewModel.resultStrings.requiredString, "")
        }
    
}
