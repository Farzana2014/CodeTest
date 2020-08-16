//
//  ResultString.swift
//  CodeTest
//
//  Created by Farzana Sultana on 8/14/20.
//  Copyright © 2020 Self. All rights reserved.
//

import Foundation

struct ResultString: Codable {
    
    let considerSpecialChar = true
    
    public var requiredString : String = "" {
        didSet{
            setValues()
        }
    }
    
    private (set) var requiredStringSolid = ""
    private (set) var lastCharacter = ""
    private (set) var characters10th = [String]()
    private (set) var formattedString = ""
    
    fileprivate mutating func extractedSolidString() {
        //print("FulL - \(requiredString.count) :" + requiredString)
        
        requiredStringSolid = requiredString.trimmingCharacters(in: .newlines)
        requiredStringSolid = requiredStringSolid.replacingOccurrences(of: "\t", with: "")
        requiredStringSolid = requiredStringSolid.replacingOccurrences(of: "\n", with: "")
        while requiredStringSolid.last?.isWhitespace == true { requiredStringSolid = String(requiredStringSolid.dropLast()) }
        
        print("Solid  - \(requiredStringSolid.count) :" + requiredStringSolid)
    }
    
    private mutating func setValues(){
        requiredStringSolid = ""
        lastCharacter = ""
        characters10th.removeAll()

        if requiredString.count > 0 {
            
            extractedSolidString()
            var tempString = considerSpecialChar ? requiredString : requiredStringSolid
 
            if tempString.count >= 0 {
                lastCharacter = String(tempString.last!)
            }
            
            formattedString += "Last Character : \(lastCharacter)\n\n"
            formattedString += "Every 10th Character : \n\n"
            
            var arrayOfWords = tempString.split {
                !($0.isASCII && ($0.isLetter || $0.isNumber))
            }
            
            tempString = arrayOfWords.map {"\($0)"}.reduce("") { $0 + $1 }
            if tempString.count >= 10 {
                for i in 1...tempString.count/10 {
                    characters10th.append(String(tempString[i*10-1]))
                    formattedString += "\(String(i*10)) \("index :") \(String(tempString[i*10-1]))\n"
                }
            }
 
            formattedString += "\n\n Count of every word : \n\n"
 
            for i in 0...arrayOfWords.count - 1 {
                formattedString += "\(String(arrayOfWords[i])) \(":") \(arrayOfWords[i].count)\n"
            }

            arrayOfWords.removeAll()
            tempString = ""
        }
    }

}


extension String {
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    var length: Int {
        return count
    }
    
}
