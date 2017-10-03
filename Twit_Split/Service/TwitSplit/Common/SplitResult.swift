//
//  SplitResult.swift
//  Twit_Split
//
//  Created by TriNgo on 10/2/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation

enum SplitResult {
    
    typealias T = [TwitObj]
    
    case success(T)
    case error(ValidateError)
    
    public var rawValue: T {
        switch self {
        case .success(let data):
            return data
        default:
            fatalError("There is no way return ERROR which corresponse with <T>")
        }
    }
    
    public var isSuccess: Bool {
        switch self {
        case .success:
            return true
        default:
            return false
        }
    }
    
    public var isError: Bool {
        switch self {
        case .error:
            return true
        default:
            return false
        }
    }
    
    public var result: T? {
        switch self {
        case .success(let data):
            return data
        default:
            return nil
        }
    }
    
    public var error: ValidateError? {
        switch self {
        case .error(let error):
            return error
        default:
            return nil
        }
    }
}
