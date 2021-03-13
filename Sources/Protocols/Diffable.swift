//
//  Diffable.swift
//  UltraKit
//
//  Created by Sergey Shalnov on 16.02.2021.
//

import Foundation

public protocol Diffable {

    var diffIdentifier: String { get }
    
}

public extension Diffable {

    var diffIdentifier: String {
        return UUID().uuidString
    }

}
