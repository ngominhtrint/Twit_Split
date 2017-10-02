//
//  StubTwitValidator.swift
//  Twit_Split
//
//  Created by TriNgo on 10/2/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation
@testable import Twit_Split

struct StubTwitValidator: TwitValidateProtocol {
    
    func validateEmptyMessage(_ message: String) -> ValidateError? {
        return nil
    }
    
    func validateWordOverMaximumLength(_ words: [String], max: Int) -> ValidateError? {
        return nil
    }
}
