//
//  TwitExtractor.swift
//  Twit_Split
//
//  Created by TriNgo on 10/2/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation

protocol TwitExtractorProtocol {
    
    var characterSet: CharacterSet { get }
    func extract(_ message: String) -> [String]
}

struct TwitExtractor: TwitExtractorProtocol {
    
    fileprivate let configurable: TwitConfigurable
    var characterSet: CharacterSet { return configurable.characterSet }
    
    init(configurable: TwitConfigurable) {
        self.configurable = configurable
    }
    
    func extract(_ message: String) -> [String] {
        return message.components(separatedBy: characterSet)
    }
}
