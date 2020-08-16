//
//  ResultStringViewModel.swift
//  CodeTest
//
//  Created by Farzana Sultana on 8/14/20.
//  Copyright © 2020 Self. All rights reserved.
//

import Combine

class ResultStringViewModel: ObservableObject {
    
    @Published var resultStrings = ResultString(requiredString: "")
    @Published var loading = false

    var processingString = ""
    
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
           // self.processingString = allString.trimmingCharacters(in: .whitespacesAndNewlines)
//           self.processingString = self.getEvery10thCharacter(string:allString)
//           self.processingString = self.processingString.appending(self.getLastCharacter(string:allString))
//           self.processingString = self.processingString.appending(self.getWordList(string:allString))
           self.resultStrings.requiredString = allString
        }
    }
    
    func getEvery10thCharacter(string: String) -> String {
        let array = String(string)
        var appendedString = "Every 10th Character: \n \n"
        
        array.enumerated().forEach {
            if( $0 % 10 == 0 && $0 > 0)
            {print ($0, ":", $1)
                appendedString = appendedString.appending(String($1).appending("\n"))
            } else {  return}
        }
        return appendedString
    }
   
    func getLastCharacter(string: String) -> String {
        return "\n\n Last Character: \n\n , \(String(describing: string.last))"
    }
       
    func getWordList(string: String) -> String {
        
        var appendedString = "\n\n Word List: \n\n"
        
        let wordList = string.split(separator: " ")
        wordList.enumerated().forEach {
            appendedString = appendedString.appending(String($0.element).appending("\n"))
        }
        return appendedString
    }
}
