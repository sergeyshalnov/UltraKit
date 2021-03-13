//
//  CollectionBuilder.swift
//  UltraKit
//
//  Created by Sergey Shalnov on 07.03.2021.
//

@_functionBuilder
public struct CollectionBuilder<T> {

    static func buildBlock() -> [T] { [] }
    
}

// MARK: - Helpers

public extension CollectionBuilder {

    static func buildBlock(_ items: T...) -> [T] {
        items
    }

}
