//
//  LinkedList.swift
//  Twit_Split
//
//  Created by TriNgo on 10/2/17.
//  Copyright © 2017 TriNgo. All rights reserved.
//

import Foundation

class LinkedList<T> {
    
    typealias NodeType = T
    
    public private(set) var head: Node<NodeType>? = nil {
        didSet {
            if tail == nil {
                tail = head
            }
        }
    }
    
    public private(set) var tail: Node<NodeType>? = nil {
        didSet {
            if head == nil {
                head = tail
            }
        }
    }
    
    public private(set) var count: Int = 0
    
    public var isEmpty: Bool { return self.count == 0 }
    
    private let _lock = NSLock()
    
    init() {}
    
    init<S: Sequence>(_ elements: S) where S.Iterator.Element == T {
        for item in elements {
            append(item)
        }
    }
    
    public func append(_ value: NodeType) {
        let node = Node(value: value)
        append(node)
    }
    
    public func append(_ node: Node<NodeType>) {
        _lock.lock()
        defer {
            _lock.unlock()
        }
        
        guard let tail = tail else {
            head = node
            count += 1
            return
        }
        
        tail.next = node
        self.tail = node
        count += 1
    }
}

extension LinkedList {
    func mapToArray() -> [T] {
        return map { $0.value }
    }
    
    public func map<E>(_ block: (Node<NodeType>) -> E) -> [E] {
        var result: [E] = []
        forEach { result.append(block($0)) }
        return result
    }
    
    public func forEach(_ block: (Node<NodeType>) -> Void) {
        var currentPointer = head
        while currentPointer != nil {
            block(currentPointer!)
            currentPointer = currentPointer?.next
        }
    }
}
