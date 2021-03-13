//
//  ControllerSection+Item.swift
//  UltraKit
//
//  Created by Sergey Shalnov on 09.02.2021.
//

import UIKit.UICollectionView

public extension ControllerSection {

    enum Item: Hashable {

        case item(value: Cellable)

        public func hash(into hasher: inout Hasher) {
            switch self {
            case let .item(value):
                hasher.combine(value.diffIdentifier)
            }
        }

    }

}

// MARK: - CollectionViewRepresentable

extension ControllerSection.Item: CollectionViewRepresentable {

    public var representation: Cellable {
        switch self {
        case let .item(value):
            return value
        }
    }

}

// MARK: - Equatable

extension ControllerSection.Item: Equatable {

    public static func == (lhs: ControllerSection.Item, rhs: ControllerSection.Item) -> Bool {
        switch (lhs, rhs) {
        case (let .item(lhs), let .item(rhs)):
            return lhs.isEqual(to: rhs)
        }
    }

}
