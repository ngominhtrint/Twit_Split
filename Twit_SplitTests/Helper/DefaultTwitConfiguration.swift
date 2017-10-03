//
//  DefaultTwitConfiguration.swift
//  Twit_Split
//
//  Created by TriNgo on 10/2/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation
@testable import Twit_Split

struct TwitDefaultConfiguration: TwitConfigurable {
    
    public let maxCharacter: Int = 50
    public let characterSet: CharacterSet = CharacterSet.whitespacesAndNewlines
    
    static let `default` = TwitDefaultConfiguration()
}
