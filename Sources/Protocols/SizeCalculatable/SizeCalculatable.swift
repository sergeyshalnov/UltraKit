//
//  SizeCalculatable.swift
//  UltraKit
//
//  Created by Sergey Shalnov on 04.02.2021.
//

import UIKit

public protocol SizeCalculatable {

    static func size(for viewModel: Any,
                     boundingSize: CGSize,
                     horizontalFittingPriority: UILayoutPriority,
                     verticalFittingPriority: UILayoutPriority) -> CGSize

}
