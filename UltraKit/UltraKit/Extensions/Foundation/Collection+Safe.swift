//
//  Collection+Safe.swift
//  UltraKit
//
//  Created by Sergey Shalnov on 10.02.2021.
//

extension Collection {

    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }

}
