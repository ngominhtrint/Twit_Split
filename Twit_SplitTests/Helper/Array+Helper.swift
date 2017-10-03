//
//  Array+Helper.swift
//  Twit_Split
//
//  Created by TriNgo on 10/3/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation
@testable import Twit_Split

extension Array where Element == TwitObj {
    
    func mapToString() -> [String] {
        return self.map { i -> String in
            return i.text
        }
    }
}

extension Array where Element == String {
    
    func isOver(_ max: Int) -> Bool {
        return self.filter { $0.characters.count > max }.isEmpty
    }
}
