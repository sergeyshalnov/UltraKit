//
//  UIView+Identifiable.swift
//  UltraKit
//
//  Created by Sergey Shalnov on 15.02.2021.
//

import UIKit.UIView

extension UIView: Identifiable {

    public class var identifier: String {
        return String(describing: self)
    }

}
