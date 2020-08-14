//
//  APIService.swift
//  CodeTest
//
//  Created by Farzana Sultana on 8/14/20.
//  Copyright © 2020 Self. All rights reserved.
//

import Foundation

let BASE_URL = "https://www.bioscopelive.com/en/disclaimer"

class APIService : ServiceProtocol {
    
    func fetchAllString(completion: @escaping (String?) -> Void) {
        loadData(completion)
    }

    private func loadData(_ completion: @escaping (String?) -> Void) {
        guard let url = URL(string: BASE_URL) else { return }
        
        URLSession.shared.dataTask(with: url){(data, response, error) in
            do {
                if let error = error {
                    print(error.localizedDescription as Any)
                    completion(nil)
                    return
                }
                if let resultData = data {
                    let decodedData = String(data: resultData, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
                    let allStrings = decodedData!.htmlToString
                    DispatchQueue.main.async {
                        completion(allStrings)
                    }
                    
                } else {
                    print("No data")
                    completion(nil)
                }
            }
            
        }.resume()
    }
    
}

