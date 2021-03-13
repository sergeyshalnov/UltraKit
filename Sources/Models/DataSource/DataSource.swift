//
//  DataSource.swift
//  UltraKit
//
//  Created by Sergey Shalnov on 09.02.2021.
//

import UIKit

final class DataSource<Section: CollectionSection, Item: CollectionItem>: UICollectionViewDiffableDataSource<Section, Item> {

    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>

}
