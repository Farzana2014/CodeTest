//
//  ServiceProtocol.swift
//  CodeTest
//
//  Created by Farzana Sultana on 8/14/20.
//  Copyright © 2020 Self. All rights reserved.
//

import Foundation

protocol ServiceProtocol {
    func fetchAllString(completion: @escaping (String?) -> Void)
}

extension String {

    var htmlToAttributedString: NSAttributedString? {
        guard
            let data = self.data(using: .utf8)
            else { return nil }
        do {
            return try NSAttributedString(data: data, options: [
                NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
                NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue
                ], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }

    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
