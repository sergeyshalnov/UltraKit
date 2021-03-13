//
//  Selectable.swift
//  UltraKit
//
//  Created by Sergey Shalnov on 17.02.2021.
//

protocol Selectable {

    func didSelect(at indexPath: IndexPath)

    func didDeselect(at indexPath: IndexPath)

}
