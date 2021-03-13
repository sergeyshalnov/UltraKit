//
//  CollectionRegisterManager.swift
//  UltraKit
//
//  Created by Sergey Shalnov on 09.02.2021.
//

import UIKit

final class CollectionRegisterManager {
    
    // MARK: - Private Properties

    private var registeredIdentifiers = Set<String>()

    private weak var collectionView: UICollectionView?

    // MARK: - Internal Properties

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }

}

// MARK: - Public Methods

extension CollectionRegisterManager {

    func register(_ cell: Identifiable.Type) {
        guard !registeredIdentifiers.contains(cell.identifier) else {
            return
        }

        let bundle = Bundle(for: cell)

        if bundle.path(forResource: cell.identifier, ofType: "nib") != nil {
            collectionView?.register(
                UINib(nibName: cell.identifier, bundle: bundle),
                forCellWithReuseIdentifier: cell.identifier
            )
        } else {
            collectionView?.register(cell, forCellWithReuseIdentifier: cell.identifier)
        }

        registeredIdentifiers.insert(cell.identifier)
    }

}
