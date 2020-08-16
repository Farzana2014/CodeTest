//
//  MockResultString.swift
//  CodeTestTests
//
//  Created by Farzana Sultana on 8/16/20.
//  Copyright © 2020 Self. All rights reserved.
//

import Foundation

extension ResultString {
    static func with(requiredString: String = "<html><body><h1 style=\"color:red;\">html text here</h1></body></html>") -> ResultString {
        return ResultString(requiredString : requiredString)
    }
}
