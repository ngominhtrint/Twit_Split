//
//  TwitExtractorTest.swift
//  Twit_Split
//
//  Created by TriNgo on 10/3/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import XCTest
@testable import Twit_Split

class TwitExtractorTest: XCTestCase {
    
    fileprivate let twitConfiguration = TwitDefaultConfiguration.default
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExtractorByWhiteSpace() {
        
        // Given
        let message = "😉 there are thousands of topics and sub-topics. Most of these are Wikipedia-style stubs with nothing more than a name. You can do some research and help flesh-out these stubs."
        let expected = ["😉", "there", "are", "thousands", "of", "topics", "and", "sub-topics.", "Most", "of", "these", "are", "Wikipedia-style" ,"stubs", "with", "nothing", "more", "than", "a", "name.", "You", "can", "do", "some", "research", "and", "help", "flesh-out", "these", "stubs."]
        
        //When
        let extractor = TwitExtractor(configurable: twitConfiguration)
        
        //Then
        let result = extractor.extract(message)
        XCTAssertEqual(result, expected, "TweetExtractor should split whole mssage to individual words by white-space")
    }
}
