//
//  PredicateResult.swift
//  
//
//  Created by Kesi Maduka on 6/23/19.
//

import Foundation

public protocol PredicateResult {

    var result: String { get }

}

public extension PredicateResult {

    internal var prefixableResult: String {
        return result.isEmpty ? "" : "\(result) "
    }

    var stringResult: String {
        return result
    }

    var predicateResult: NSPredicate {
        return NSPredicate(format: result)
    }

}
