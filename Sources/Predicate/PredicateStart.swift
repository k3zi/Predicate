//
//  PredicateStart.swift
//  
//
//  Created by Kesi Maduka on 6/23/19.
//

import Foundation

public struct PredicateStart<T>: PredicateQueryable, PredicateResult {

    public typealias Base = T

    public let result: String

    internal init() {
        result = ""
    }

    internal init(_ intermediateResult: String) {
        result = intermediateResult
    }

}
