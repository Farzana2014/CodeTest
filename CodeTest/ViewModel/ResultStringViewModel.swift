//
//  ResultStringViewModel.swift
//  CodeTest
//
//  Created by Farzana Sultana on 8/14/20.
//  Copyright © 2020 Self. All rights reserved.
//

import Foundation

class ResultStringViewModel: ObservableObject {
    @Published var resultStrings = ResultString(requiredString: "")
    @Published var loading = false

    let service: ServiceProtocol
    init(service: ServiceProtocol = APIService()) {
        self.service = service
    }
    
    func loadData() {
        self.loading = true
        service.fetchAllString { allString in
            self.loading = false
            guard let allString = allString else {
                return
            }
            self.resultStrings.requiredString = allString
        }
    }
}
