//
//  CollectionViewConfigurable.swift
//  UltraKit
//
//  Created by Sergey Shalnov on 15.02.2021.
//

public protocol CollectionViewConfigurable {

    func configure(with viewModel: Any)

}

// MARK: - Configurable

public extension CollectionViewConfigurable where Self: Configurable {

    func configure(with viewModel: Any) {
        guard let viewModel = viewModel as? ViewModel else {
            return
        }

        configure(with: viewModel)
    }

}
