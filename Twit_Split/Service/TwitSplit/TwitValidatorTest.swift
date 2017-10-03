//
//  TwitValidatorTest.swift
//  Twit_Split
//
//  Created by TriNgo on 10/3/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import XCTest
@testable import Twit_Split

class TwitValidatorTest: XCTestCase {
    
    fileprivate let twitConfiguration = TwitDefaultConfiguration.default
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEmptyMessage() {
        //Give
        let message = ""
        
        //When
        let validator = TwitValidator()
        
        //Then
        let error = validator.validateEmptyMessage(message)
        XCTAssertNotNil(error, "Empty Message is invalid")
        XCTAssertEqual(error!, .invalid, "Validate Result should be invalid")
    }
    
    func testMessageContainsOneWordOverMaximum() {
        // Given
        let message = "Hello Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift,Swift"
        let words = message.components(separatedBy: twitConfiguration.characterSet)
        
        //When
        let validator = TwitValidator()
        
        //Then
        let error = validator.validateWordOverMaximumLength(words, max: twitConfiguration.maxCharacter)
        XCTAssertNotNil(error, "Empty Message is invalid")
        XCTAssertEqual(error!, .wordLength, "Validate Result should be invalid")
    }
}
