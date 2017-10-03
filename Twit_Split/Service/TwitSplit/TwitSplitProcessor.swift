//
//  TwitSplitProcessor.swift
//  Twit_Split
//
//  Created by TriNgo on 10/3/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation

protocol SplitProcessor {
    
    var configuration: TwitConfigurable { get }
    var indicator: TwitIndicatorProtocol { get }
    var extractor: TwitExtractorProtocol { get }
    var validator: TwitValidateProtocol { get }
    
    func process(_ message: String) -> SplitResult
}

struct TwitSplitProcessor: SplitProcessor {
    
    let configuration: TwitConfigurable
    let indicator: TwitIndicatorProtocol
    let extractor: TwitExtractorProtocol
    let validator: TwitValidateProtocol
    
    init(configuration: TwitConfigurable, indicator: TwitIndicatorProtocol, extractor: TwitExtractorProtocol, validator: TwitValidateProtocol) {
        self.configuration = configuration
        self.indicator = indicator
        self.extractor = extractor
        self.validator = validator
    }
    
    init() {
        self.configuration = TwitConfiguration()
        self.indicator = TwitIndicator(index: 0, total: 0)
        self.extractor = TwitExtractor(configurable: configuration)
        self.validator = TwitValidator()
    }
    
    func process(_ message: String) -> SplitResult {
        let message = message.trim()
        
        if let error = validator.validateEmptyMessage(message) {
            return .error(error)
        }
        
        if message.characters.count < configuration.maxCharacter {
            return .success([TwitObj(text: message)])
        }
        
        return buildTwit(with: message)
    }
}

extension TwitSplitProcessor {
    
    fileprivate func buildTwit(with message: String) -> SplitResult {
        let words = extractor.extract(message)
        
        if let error = validator.validateWordOverMaximumLength(words, max: configuration.maxCharacter) {
            return .error(error)
        }
        
        let builder = TwitBuilder(words: words, indicator: indicator, configuration: configuration)
        return builder.build()
    }
}
