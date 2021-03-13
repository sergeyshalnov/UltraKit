//
//  BaseCollectionViewCell.swift
//  UltraKitExample
//
//  Created by Sergey Shalnov on 13.03.2021.
//

import UIKit.UICollectionViewCell

open class BaseCollectionViewCell: UICollectionViewCell {

    // MARK: - Initialization

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    // MARK: - To Override

    open func commonInit() {
        addViews()
        configureConstraints()
        configureAppearance()
    }

    open func addViews() { }

    open func configureConstraints() { }

    open func configureAppearance() { }

}

