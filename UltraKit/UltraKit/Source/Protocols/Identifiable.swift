//
//  Identifiable.swift
//  UltraKit
//
//  Created by Sergey Shalnov on 09.02.2021.
//

import UIKit.UIView

public protocol Identifiable: class {

    static var identifier: String { get }

}
