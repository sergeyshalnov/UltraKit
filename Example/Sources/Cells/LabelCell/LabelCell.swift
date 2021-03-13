//
//  LabelCell.swift
//  UltraKitExample
//
//  Created by Sergey Shalnov on 13.03.2021.
//

import UltraKit
import UIKit

final class LabelCell: BaseCollectionViewCell, SizeCalculatable {

    // MARK: - Private Properties

    private let titleLabel = UILabel()

    private let view = UIView()

    // MARK: - Overriden

    override func addViews() {
        super.addViews()
        contentView.addSubview(titleLabel)
    }

    override func configureConstraints() {
        super.configureConstraints()

        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    override func configureAppearance() {
        super.configureAppearance()

        titleLabel.textColor = .black
        titleLabel.numberOfLines = .zero
    }

}

// MARK: - Mockable

extension LabelCell: Mockable {

    static let mock: LabelCell = LabelCell()

}

// MARK: - Configurable

extension LabelCell: Configurable {

    func configure(with viewModel: LabelViewModel) {
        titleLabel.text = viewModel.text
    }

}

// MARK: - CollectionViewConfigurable

extension LabelCell: CollectionViewConfigurable { }
