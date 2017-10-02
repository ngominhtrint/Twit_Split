//
//  TwitConfiguration.swift
//  Twit_Split
//
//  Created by TriNgo on 10/2/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation

protocol TwitConfigurable {
    var maxCharacter: Int { get }
    var characterSet: CharacterSet { get }
}

struct TwitConfiguration: TwitConfigurable {
    public let maxCharacter: Int = 50
    public let characterSet: CharacterSet = CharacterSet.whitespacesAndNewlines
}
