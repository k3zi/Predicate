//
//  PredicateEnd.swift
//  
//
//  Created by Kesi Maduka on 6/23/19.
//

import Foundation

public struct PredicateEnd<T>: PredicateQueryable {

    public typealias Base = T

    public let result: String

    internal init() {
        result = ""
    }

    internal init(_ intermediateResult: String, connector: PredicateConnectorType) {
        result = [intermediateResult, connector.rawValue].joined(separator: " ")
    }

}
