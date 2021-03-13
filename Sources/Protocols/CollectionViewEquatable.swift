//
//  CollectionViewEquatable.swift
//  UltraKit
//
//  Created by Sergey Shalnov on 09.02.2021.
//

public protocol CollectionViewEquatable {

    func isEqual(to object: Any) -> Bool

}

public extension CollectionViewEquatable where Self: Equatable {

    func isEqual(to object: Any) -> Bool {
        guard let object = object as? Self else {
            return false
        }

        return self == object
    }

}
