//
//  PredicateQuery.swift
//  
//
//  Created by Kesi Maduka on 6/23/19.
//

import Foundation

public struct PredicateQuery<T>: PredicateResult {

    public typealias Connector = PredicateConnector<T>

    public let result: String

    init(_ intermediateResult: String) {
        result = intermediateResult
    }

    func escaped(value: Any) -> String {
        switch value {
        case is String:
            return "\"\(value)\""
        case is Bool:
            return value as! Bool ? "YES" : "NO"
        default:
            return "\(value)"
        }
    }

    func generateFlags(caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> String {
        var flags = [String]()
        if caseInsensitive {
            flags.append("c")
        }
        if diacriticInsensitive {
            flags.append("d")
        }
        return !flags.isEmpty ? "[\(flags.joined())]" : ""
    }

    func generateBinaryConnector(with symbol: String, value: Any, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> Connector {
        let flagString = generateFlags(caseInsensitive: caseInsensitive, diacriticInsensitive: diacriticInsensitive)
        return Connector("\(result) \(symbol)\(flagString) \(escaped(value: value))")
    }

    public func equal(to value: Any) -> Connector {
        return generateBinaryConnector(with: "==", value: value)
    }

    public func notEqual(to value: Any) -> Connector {
        return generateBinaryConnector(with: "!=", value: value)
    }

    public func greater(than value: Any) -> Connector {
        return generateBinaryConnector(with: ">", value: value)
    }

    public func greaterThanOrEqual(to value: Any) -> Connector {
        return generateBinaryConnector(with: ">=", value: value)
    }

    public func less(than value: Any) -> Connector {
        return generateBinaryConnector(with: "<", value: value)
    }

    public func lessThanOrEqual(to value: Any) -> Connector {
        return generateBinaryConnector(with: "<=", value: value)
    }

    public func containing(_ value: Any, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> Connector {
        return generateBinaryConnector(with: "CONTAINS", value: value, caseInsensitive: caseInsensitive, diacriticInsensitive: diacriticInsensitive)
    }

    public func notContaining(_ value: Any, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> Connector {
        return generateBinaryConnector(with: "NOT CONTAINS", value: value, caseInsensitive: caseInsensitive, diacriticInsensitive: diacriticInsensitive)
    }

    public func begins(with value: Any, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> Connector {
        return generateBinaryConnector(with: "BEGINSWITH", value: value, caseInsensitive: caseInsensitive, diacriticInsensitive: diacriticInsensitive)
    }

    public func ends(with value: Any, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> Connector {
        return generateBinaryConnector(with: "ENDSWITH", value: value, caseInsensitive: caseInsensitive, diacriticInsensitive: diacriticInsensitive)
    }

    public func like(_ value: Any, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> Connector {
        return generateBinaryConnector(with: "LIKE", value: value, caseInsensitive: caseInsensitive, diacriticInsensitive: diacriticInsensitive)
    }

    public func matches(_ value: Any, caseInsensitive: Bool = false, diacriticInsensitive: Bool = false) -> Connector {
        return generateBinaryConnector(with: "MATCHES", value: value, caseInsensitive: caseInsensitive, diacriticInsensitive: diacriticInsensitive)
    }

}
