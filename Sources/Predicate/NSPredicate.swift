//
//  NSPredicate.swift
//  
//
//  Created by Kesi Maduka on 6/23/19.
//

import Foundation

extension NSPredicate {

    public class func with<T>(type: T.Type) -> PredicateStart<T> {
        return .init()
    }

}
