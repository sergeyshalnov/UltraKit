//
//  DefaultCollectionManager.swift
//  UltraKit
//
//  Created by Sergey Shalnov on 09.02.2021.
//

import UIKit.UICollectionView

public final class DefaultCollectionManager: CollectionManager<ControllerSection, ControllerSection.Item> {

    // MARK: - Private Properties

    private var items: [ControllerSection.Item] = []

}

// MARK: - Public

public extension DefaultCollectionManager {

    func apply(_ viewModels: [Cellable], animated: Bool) {
        self.items = viewModels.map(ControllerSection.Item.item(value:))

        apply(
            section: .main,
            items: items,
            animated: animated
        )
    }

    func apply<T>(_ providers: [Cell<T>], animated: Bool) {
        self.items = providers.map(ControllerSection.Item.item(value:))

        apply(
            section: .main,
            items: items,
            animated: true
        )
    }

    func apply<T>(animated: Bool = true, @CollectionBuilder<Cell<T>> _ builder: () -> [Cell<T>]) {
        apply(builder(), animated: animated)
    }

}
