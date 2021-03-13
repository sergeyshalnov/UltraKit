//
//  CollectionManager.swift
//  UltraKit
//
//  Created by Sergey Shalnov on 09.02.2021.
//

import UIKit.UICollectionView

public class CollectionManager<Section: CollectionSection, Item: CollectionItem>: NSObject,
                                                                                  UICollectionViewDelegate,
                                                                                  UICollectionViewDelegateFlowLayout {

    // MARK: - Private Properties
    
    private let collectionRegisterManager: CollectionRegisterManager

    private var dataSource: DataSource<Section, Item>?

    // MARK: - Internal

    weak var collectionView: UICollectionView?

    var sections: [Section: [Item]] = [:]

    // MARK: - Initialization

    public init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionRegisterManager = CollectionRegisterManager(collectionView: collectionView)

        super.init()
        
        configure()
    }

    // MARK: - UICollectionViewDelegate

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = findItem(at: indexPath),
              let selectableItem = item.representation as? Selectable else {

            return
        }

        selectableItem.didSelect(at: indexPath)
    }

    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let item = findItem(at: indexPath),
              let selectableItem = item.representation as? Selectable else {

            return
        }

        selectableItem.didDeselect(at: indexPath)
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {

        guard let item = findItem(at: indexPath) else {
            return .zero
        }

        return item.representation.size(
            for: item.representation.model,
            boundingSize: collectionView.bounds.size,
            horizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
    }

}

// MARK: - Configure

private extension CollectionManager {

    func configure() {
        configureDataSource()
        configureCollectionView()
    }

    func configureDataSource() {
        guard let collectionView = collectionView else {
            assertionFailure("CollectionManager didn't configure with collection view instance!")
            return
        }

        dataSource = DataSource<Section, Item>(
            collectionView: collectionView,
            cellProvider: { [weak self] collectionView, indexPath, item -> UICollectionViewCell? in
                self?.collectionRegisterManager.register(item.representation.type)
                return item.representation.cell(collectionView, for: indexPath)
            }
        )
    }

    func configureCollectionView() {
        collectionView?.delegate = self
    }

}

// MARK: - Public

public extension CollectionManager {

    func apply(section: Section,
               items: [Item],
               animated: Bool) {

        sections[section] = items

        DispatchQueue.main.async { [weak self] in
            var snapshot = DataSource<Section, Item>.Snapshot()

            snapshot.appendSections([section])
            snapshot.appendItems(items, toSection: section)

            self?.dataSource?.apply(snapshot, animatingDifferences: animated)
        }
    }

    func apply(section: Section,
               animated: Bool = true,
               @CollectionBuilder<Item> _ builder: () -> [Item]) {

        apply(
            section: section,
            items: builder(),
            animated: animated
        )
    }

}

// MARK: - Private

private extension CollectionManager {

    func findItem(at indexPath: IndexPath) -> Item? {
        let enumeratedSection = Section
            .allCases
            .enumerated()
            .first { $0.offset == indexPath.section }

        guard let section = enumeratedSection?.element else {
            return nil
        }

        return sections[section]?
            .enumerated()
            .first { $0.offset == indexPath.row }?
            .element
    }

}
