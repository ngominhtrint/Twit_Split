//
//  ValidateError.swift
//  Twit_Split
//
//  Created by TriNgo on 10/2/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation

public enum ValidateError: Error {
    
    case wordLength
    case indicatorLength
    case invalid
    
    public var splitError: String {
        switch self {
        case .wordLength:
            return "There is no space that we couldn't split to separate part"
        case .indicatorLength:
            return "Indicator length is over then 50"
        case .invalid:
            return "Invalid tweet"
        }
    }
}
