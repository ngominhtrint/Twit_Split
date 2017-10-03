//
//  TwitComponent.swift
//  Twit_Split
//
//  Created by TriNgo on 10/3/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation

class TwitComponent {
    
    fileprivate var wordStacks: LinkedList<String>
    
    fileprivate var wordCount: Int
    
    fileprivate var indicator: TwitIndicatorProtocol
    
    init(indicator: TwitIndicatorProtocol, wordStacks: [String] = []) {
        self.indicator = indicator
        self.wordStacks = LinkedList<String>(wordStacks)
        self.wordCount = wordStacks.map { $0.characters.count }.reduce(0, +)
    }
    
    func append(_ newWord: String, maxCount: Int) -> Bool {
        
        let nextCount = indicator.toString().characters.count + wordCount + newWord.characters.count
        
        let spaceCount = 1 + wordStacks.count
        
        guard nextCount + spaceCount <= maxCount else {
            return true
        }
        
        wordStacks.append(newWord)
        wordCount += newWord.characters.count
        
        return false
    }
    
    func build() -> TwitObj {
        let words = wordStacks.mapToArray()
        
        let allWords = [indicator.toString()] + words
        
        let content = allWords.joined(separator: " ")
        
        return TwitObj(text: content)
    }
    
    func updateTotalPage(_ total: Int) {
        indicator.total = total
    }
}
