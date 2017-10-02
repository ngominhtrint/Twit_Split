//
//  StubTwitExtractor.swift
//  Twit_Split
//
//  Created by TriNgo on 10/2/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation
@testable import Twit_Split

struct StubTwitExtractor: TwitExtractorProtocol {
    
    var characterSet: CharacterSet { return .whitespaces }
    
    func extract(_ message: String) -> [String] {
        return []
    }
}
