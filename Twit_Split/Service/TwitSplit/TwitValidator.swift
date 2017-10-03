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

struct TwitValidator: TwitValidateProtocol {
    
    func validateEmptyMessage(_ message: String) -> ValidateError? {
        if message.isEmpty {
            return .invalid
        }
        
        return nil
    }
    
    func validateWordOverMaximumLength(_ words: [String], max: Int) -> ValidateError? {
        guard words.first(where: { $0.characters.count > max }) == nil else {
            return .wordLength
        }
        
        return nil
    }
}
