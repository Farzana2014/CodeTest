//
//  MockService.swift
//  CodeTestTests
//
//  Created by Farzana Sultana on 8/16/20.
//  Copyright © 2020 Self. All rights reserved.
//

import Foundation

class MockService : ServiceProtocol {

    let mockData: String?
    
    init(mockData: String?) {
        self.mockData = mockData
    }
    
    func fetchAllString(completion: @escaping (String?) -> Void){
        completion(mockData)
    }
    
}
