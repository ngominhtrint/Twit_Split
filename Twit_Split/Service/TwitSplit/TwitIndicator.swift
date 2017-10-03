//
//  TwitIndicator.swift
//  Twit_Split
//
//  Created by TriNgo on 10/2/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation

protocol TwitIndicatorProtocol {
    
    var index: Int { get set }
    var total: Int { get set }
    
    func toString() -> String
}

extension TwitIndicatorProtocol {
    
    mutating func update(_ index: Int, total: Int) {
        self.index = index
        self.total = total
    }
}

struct TwitIndicator: TwitIndicatorProtocol {
    var index: Int
    var total: Int
    
    func toString() -> String {
        return "\(index)/\(total)"
    }
}
