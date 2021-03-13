//
//  ViewController.swift
//  UltraKitExample
//
//  Created by Sergey Shalnov on 04.02.2021.
//

import SnapKit
import UIKit
import UltraKit

final class ViewController: UIViewController {

    // MARK: - UI

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    // MARK: - Private Properties

    private lazy var collectionManager = DefaultCollectionManager(collectionView: collectionView)
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        addViews()
        configureConstraints()
        configureAppearance()
        configureLayout()
    }

}

// MARK: - Add

private extension ViewController {

    func addViews() {
        view.addSubview(collectionView)
    }

}

// MARK: - Constraints

private extension ViewController {

    func configureConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

// MARK: - Appearance

private extension ViewController {

    func configureAppearance() {
        collectionView.backgroundColor = .white
        collectionView.alpha = 1
        view.backgroundColor = .white
    }

}

// MARK: - Layout

private extension ViewController {

    func configureLayout() {
        collectionManager.apply {
            Cell<LabelCell>(viewModel: LabelViewModel(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."))
                .on(.select) { _ in print("did tap first label") }
            Cell<LabelCell>(viewModel: LabelViewModel(text: "Lorem ipsum dolor sit amet."))
                .on(.select) { _ in print("did tap second label") }
        }
    }

}

