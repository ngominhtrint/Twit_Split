//
//  Node.swift
//  Twit_Split
//
//  Created by TriNgo on 10/2/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation

class Node<T> {
    
    public let value: T
    
    public var next: Node<T>? = nil
    
    init(value: T) {
        self.value = value
    }
}
