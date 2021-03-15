//
//  Cell.swift
//  UltraKit
//
//  Created by Sergey Shalnov on 16.02.2021.
//

import UIKit.UICollectionViewCell

public final class Cell<T: UICollectionViewCell & Configurable> {

    // MARK: - Private Properties

    private var actions: [CellActionType: [CellActionHandler]] = [:]
    
    // MARK: - Dependencies

    private let viewModel: T.ViewModel

    // MARK: - Public Properties

    public let type: UICollectionViewCell.Type

    // MARK: - Initialization

    public init(viewModel: T.ViewModel) {
        self.type = T.self
        self.viewModel = viewModel
    }
    
}

// MARK: - Public

public extension Cell {

    @discardableResult
    func on(_ action: CellActionType, _ handler: @escaping (CellActionOptions) -> Void) -> Self {
        if actions[action] == nil {
            actions[action] = [CellActionHandler]()
        }

        actions[action]?.append(.init(handler: handler))

        return self
    }

}

// MARK: - Cellable

extension Cell: Cellable {

    public var model: Any {
        return viewModel
    }

    public var id: String {
        return viewModel.id
    }


}

// MARK: - CollectionViewRepresentable

extension Cell: CollectionViewRepresentable {

    public var representation: Cellable {
        return self
    }

}

// MARK: - CollectionViewEquatable

extension Cell: CollectionViewEquatable { }

// MARK: - Selectable

extension Cell: Selectable {

    func didSelect(at indexPath: IndexPath) {
        actions[.select]?.forEach { handler in
            handler.handler(CellActionOptions(indexPath: indexPath))
        }
    }

    func didDeselect(at indexPath: IndexPath) {
        actions[.deselect]?.forEach { handler in
            handler.handler(CellActionOptions(indexPath: indexPath))
        }
    }
    
}

// MARK: - Equatable

extension Cell: Equatable {

    public static func == (lhs: Cell<T>, rhs: Cell<T>) -> Bool {
        return lhs.viewModel.id == rhs.viewModel.id &&
            lhs.type == rhs.type
    }

}
