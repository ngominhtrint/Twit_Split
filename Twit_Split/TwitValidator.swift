//
//  TwitValidator.swift
//  Twit_Split
//
//  Created by TriNgo on 10/2/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation

protocol TwitValidateProtocol {
    
    func validateEmptyMessage(_ message: String) -> ValidateError?
    func validateWordOverMaximumLength(_ words: [String], max: Int) -> ValidateError?
}

struct TwitValidator {
    
}
