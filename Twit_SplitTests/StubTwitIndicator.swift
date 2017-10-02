//
//  StubTwitIndicator.swift
//  Twit_Split
//
//  Created by TriNgo on 10/2/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation
@testable import Twit_Split

struct StubTwitIndicator: TwitIndicatorProtocol {
    
    var index: Int = 0
    var total: Int = 0
    
    func toString() -> String {
        return ""
    }
}
