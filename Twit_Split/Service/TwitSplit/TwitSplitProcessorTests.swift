//
//  TwitSplitProcessorTests.swift
//  Twit_Split
//
//  Created by TriNgo on 10/3/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import XCTest
@testable import Twit_Split

class TwitSplitProcessorTests: XCTestCase {
    
    fileprivate let twitConfiguration = TwitDefaultConfiguration.default
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTwitMessageLengthLessThanMaximum() {
        //Give
        let input = "Hello, Swift"
        let expected = ["Hello, Swift"]
        
        //When
        let processor = TwitSplitProcessor()
        let result = processor.process(input)
        
        //Then
        switch result {
        case .error(let error):
            XCTFail(error.localizedDescription)
        case .success(let twits):
            let twits = twits.mapToString()
            XCTAssertTrue(twits.isOver(twitConfiguration.maxCharacter), "There is no Tweet which length is excessed the maximum")
            XCTAssertEqual(twits.count, 1, "Should only 1 components")
            XCTAssertEqual(twits, expected, "Short Message should be same the original")
        }
    }
    
    func testTheExampleInAssigment() {
        //Give
        let input = "I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself."
        let expected = ["1/2 I can't believe Tweeter now supports chunking",
                        "2/2 my messages, so I don't have to do it myself."]
        
        //When
        let processor = TwitSplitProcessor()
        let result = processor.process(input)
        
        //Then
        switch result {
        case .error(let error):
            XCTFail(error.localizedDescription)
        case .success(let twits):
            let twits = twits.mapToString()
            XCTAssertTrue(twits.isOver(twitConfiguration.maxCharacter), "There is no Tweet which length is excessed the maximum")
            XCTAssertEqual(twits.count, 2, "Should only 2 components")
            XCTAssertEqual(twits, expected, "Same the expectation from the Assignment")
        
        }
    }
    
    func testAnyMessageLengthOverThanMaximum() {
        // Give
        let input = "Hello, Swiftabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc"
        
        //When
        let processor = TwitSplitProcessor()
        let result = processor.process(input)
        
        //Then
        switch result {
        case .error(let error):
            XCTAssertEqual(error, .wordLength, error.localizedDescription)
        case .success:
            XCTFail("the Legnth of certain words are over the maximum.")
        }
    }
    
    func testCreateTweetComponentWithNewOneCase() {
        
        //Give
        let input = "Twitter mostly uses Ruby on Rails for their front-end and primarily Scala and Java for back-end services. They use Apache Thrift (originally developed by Facebook) to communicate between different internal services."
        
        let expected = ["1/6 Twitter mostly uses Ruby on Rails for their",
                            "2/6 front-end and primarily Scala and Java for",
                            "3/6 back-end services. They use Apache Thrift",
                            "4/6 (originally developed by Facebook) to",
                            "5/6 communicate between different internal",
                            "6/6 services."]
        
        //When
        let processor = TwitSplitProcessor()
        let result = processor.process(input)
        
        //Then
        switch result {
        case .error(let error):
            assertionFailure(error.localizedDescription)
        case .success(let twits):
            let twits = twits.mapToString()
            XCTAssertTrue(twits.isOver(twitConfiguration.maxCharacter), "There is no Tweet which length is excessed the maximum")
            XCTAssertEqual(twits, expected, "The last character (Service) didn't add to new component")
        }
    }
    
    func testOneWordIsExcessMaximumCase() {
        // Give
        let input = "Facebook just switched several of its open source projects — including ReactReactReactReactReactReactReactReactReactReactReactReactReactReactReact — over to the popular MIT license. Before that, Facebook was using their own custom “BSD+Patents” license. This was similar to the widely-used BSD license, but also included a clause that basically said: “you can’t sue Facebook for infringing on your patents. This license came under fire this summer. Here’s what happened."
        
        //When
        let processor = TwitSplitProcessor()
        let result = processor.process(input)
        
        //Then
        switch result {
        case .error(let error):
            XCTAssertEqual(error, .wordLength, error.localizedDescription)
        case .success:
            XCTFail("the Legnth of certain words are over the maximum.")
        }
    }
}




























