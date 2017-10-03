//
//  TwitComponentTest.swift
//  Twit_Split
//
//  Created by TriNgo on 10/3/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import XCTest
@testable import Twit_Split

class TwitComponentTest: XCTestCase {
    
    fileprivate let twitConfiguration = TwitDefaultConfiguration.default
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testBuildTwitObjFromAppropriateWords() {

        // Given
        let wordStacks = ["Hello", "It", "is", "the", "ordinary", "comment"]
        let expected = "1/2 Hello It is the ordinary comment"

        //When
        let indicator = SplashTwitIndicator(index: 1, total: 2)
        let component = TwitComponent(indicator: indicator, wordStacks: wordStacks)
        let twitObj = component.build()
        
        //Then
        XCTAssertEqual(twitObj.text, expected, "TwitObj's text doesn't match with words which built from TwitComponent")
    }
    
    func testUpdateTotalPage() {
        //Give
        let indicator = SplashTwitIndicator(index: 1, total: 2)
        let expected = SplashTwitIndicator(index: 1, total: 5)
        
        //When
        let component = TwitComponent(indicator: indicator, wordStacks: [])
        component.updateTotalPage(expected.total)
        let twit = component.build()
        
        //Then
        XCTAssertEqual(twit.text, expected.toString(), "Indicator page didn't update the total number")
    }
    
    func testAppendNewWordIntoStackWithoutOver() {
        // Given
        let wordStacks = ["Hello", "It", "is", "the", "ordinary", "comment"]
        
        //When
        let indicator = SplashTwitIndicator(index: 1, total: 2)
        let component = TwitComponent(indicator: indicator, wordStacks: wordStacks)
        let isOver = component.append("SWIFT", maxCount: twitConfiguration.maxCharacter)
        
        //Then
        XCTAssertFalse(isOver, "Append short word into non-full stack shouldn't be over")
    }
    
    func testAppendNewWordIntoStackCauseOver() {
        //Give
        let wordStacks = ["Hello", "It", "is", "the", "ordinary", "comment"]
        
        //When
        let indicator = SplashTwitIndicator(index: 1, total: 2)
        let component = TwitComponent(indicator: indicator, wordStacks: wordStacks)
        let isOver = component.append("SWIFTSWIFTSWIFTSWIFTSWIFTSWIFTSWIFTSWIFTSWIFT", maxCount: twitConfiguration.maxCharacter)
        
        //Then
        XCTAssertTrue(isOver, "Append too long word into non-full stack should be excessed")
    }
}
