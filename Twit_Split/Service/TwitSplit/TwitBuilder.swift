//
//  TwitBuilder.swift
//  Twit_Split
//
//  Created by TriNgo on 10/3/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation

private struct TwitBuildResult {
    let components: [TwitComponent]
    let totalPage: Int
}

class TwitBuilder{
    fileprivate let configuration: TwitConfigurable
    fileprivate var indicator: TwitIndicatorProtocol
    fileprivate let words: [String]
    fileprivate var maxCount: Int { return self.configuration.maxCharacter }
    
    init(words: [String], indicator: TwitIndicatorProtocol, configuration: TwitConfigurable) {
        self.words = words
        self.indicator = indicator
        self.configuration = configuration
    }
    
    func build() -> SplitResult {
        let result = processTwitComponents()
        var components = result.components
        
        let needRebuilt = components.filter { $0.build().text.characters.count > maxCount }.count > 0
        if needRebuilt {
            let totalPage = result.totalPage
            let result = processTwitComponents(totalPage)
            components = result.components
        }
        
        let twits = components.map { $0.build() }
        return .success(twits)
    }
}

extension TwitBuilder {
    fileprivate func processTwitComponents(_ totalPage: Int = 1) -> TwitBuildResult {
        
        let components = LinkedList<TwitComponent>([])
        var currentPage = 1
        
        indicator.update(1, total: totalPage)
        var currentComponent = TwitComponent(indicator: indicator)
        
        var i = 0
        while i < words.count {
            let word = words[i]
            
            let isOver = currentComponent.append(word, maxCount: maxCount)
            
            if isOver {
                components.append(currentComponent)
                currentPage += 1
                
                indicator.update(currentPage, total: totalPage)
                currentComponent = TwitComponent(indicator: indicator)
                continue
            }
            
            i += 1
        }
        
        components.append(currentComponent)
        components.forEach { $0.value.updateTotalPage(currentPage) }
        
        return TwitBuildResult(components: components.mapToArray(), totalPage: currentPage)
    }
}
