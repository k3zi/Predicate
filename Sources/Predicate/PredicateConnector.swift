//
//  PredicateConnector.swift
//  
//
//  Created by Kesi Maduka on 6/23/19.
//

import Foundation

public struct PredicateConnector<T>: PredicateResult {

    public typealias End = PredicateEnd<T>

    public let result: String

    init(_ intermediateResult: String) {
        result = intermediateResult
    }

    public var or: End {
        return End(result, connector: .or)
    }
    public var and: End {
        return End(result, connector: .and)
    }

}
