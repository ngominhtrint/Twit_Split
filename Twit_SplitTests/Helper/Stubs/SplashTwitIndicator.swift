//
//  SplashTwitIndicator.swift
//  Twit_Split
//
//  Created by TriNgo on 10/2/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation
@testable import Twit_Split

struct SplashTwitIndicator: TwitIndicatorProtocol {
    
    var index: Int
    var total: Int
    
    func toString() -> String {
        return "\(index)/\(total)"
    }
}
