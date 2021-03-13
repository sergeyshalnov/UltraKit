//
//  Cellable.swift
//  UltraKit
//
//  Created by Sergey Shalnov on 04.02.2021.
//

import UIKit.UICollectionView

public protocol Cellable: CollectionViewEquatable & Diffable {

    // MARK: - Properties

    var model: Any { get }

    var type: UICollectionViewCell.Type { get }

    // MARK: - Methods

    func cell(_ collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionViewCell

    func size(for viewModel: Any,
              boundingSize: CGSize,
              horizontalFittingPriority: UILayoutPriority,
              verticalFittingPriority: UILayoutPriority) -> CGSize

}

// MARK: - Default

public extension Cellable {

    func cell(_ collectionView: UICollectionView, for indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath)

        guard let unwrappedCell = cell as? UICollectionViewCell & CollectionViewConfigurable else {
            return cell
        }

        unwrappedCell.configure(with: model)

        return unwrappedCell
    }

    func size(for viewModel: Any,
              boundingSize: CGSize,
              horizontalFittingPriority: UILayoutPriority,
              verticalFittingPriority: UILayoutPriority) -> CGSize {

        guard let cell = type as? SizeCalculatable.Type else {
            fatalError("not implemented")
        }

        return cell.size(
            for: viewModel,
            boundingSize: boundingSize,
            horizontalFittingPriority: horizontalFittingPriority,
            verticalFittingPriority: verticalFittingPriority
        )
    }

}
