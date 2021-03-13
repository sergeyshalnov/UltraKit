//
//  SizeCalculatable+Extensions.swift
//  UltraKit
//
//  Created by Sergey Shalnov on 04.02.2021.
//

import UIKit

public extension SizeCalculatable where Self: UICollectionViewCell & Configurable & Mockable {

    static func size(for viewModel: Any,
                     boundingSize: CGSize,
                     horizontalFittingPriority: UILayoutPriority,
                     verticalFittingPriority: UILayoutPriority) -> CGSize {

        guard let viewModel = viewModel as? ViewModel else {
            return .zero
        }

        let cell = mock

        cell.configure(with: viewModel)
        cell.setNeedsLayout()
        cell.layoutIfNeeded()

        let size = cell.contentView.systemLayoutSizeFitting(
            boundingSize,
            withHorizontalFittingPriority: horizontalFittingPriority,
            verticalFittingPriority: verticalFittingPriority
        )

        return size
    }

}
