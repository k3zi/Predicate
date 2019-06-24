//
//  PredicateQueryable.swift
//  
//
//  Created by Kesi Maduka on 6/23/19.
//

import Foundation

public protocol PredicateQueryable {

    associatedtype Base

    var result: String { get }

}

extension PredicateQueryable {

    var prefixableResult: String {
        return result.isEmpty ? "" : "\(result) "
    }

}

public extension PredicateQueryable {

    subscript(_ keyPath: String) -> PredicateQuery<Base> {
        return property(keyPath)
    }

    subscript<Value>(_ keyPath: KeyPath<Base, Value>) -> PredicateQuery<Base> where Base: NSObject {
        return property(keyPath)
    }

    func property(_ keyPath: String) -> PredicateQuery<Base> {
        return PredicateQuery<Base>("\(prefixableResult)\(keyPath)")
    }

    func property<Value>(_ keyPath: KeyPath<Base, Value>) -> PredicateQuery<Base> where Base: NSObject {
        return PredicateQuery<Base>("\(prefixableResult)\(NSExpression(forKeyPath: keyPath).keyPath)")
    }

}
