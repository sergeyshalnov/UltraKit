//
//  LabelViewModel.swift
//  UltraKitExample
//
//  Created by Sergey Shalnov on 13.03.2021.
//

import Foundation
import UltraKit

struct LabelViewModel: Equatable, Diffable {

    let id: String = UUID().uuidString

    let text: String

}
