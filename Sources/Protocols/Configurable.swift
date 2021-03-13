//
//  Configurable.swift
//  UltraKit
//
//  Created by Sergey Shalnov on 04.02.2021.
//

public protocol Configurable {

    // MARK: - Associated Type

    associatedtype ViewModel: Diffable

    // MARK: - Methods

    func configure(with viewModel: ViewModel)

}
