//
//  PaymentViewModel.swift
//  TipperSwiftUI
//
//  Created by Vui Nguyen on 4/20/22.
//

import Foundation

enum PaymentMethod: segmentedControl {
    case credit
    case applepay
    case cash
    
    var description: String {
        switch self {
        case .credit:
            return "Credit"
        case .applepay:
            return "Apple Pay"
        case .cash:
            return "Cash"
        }
    }
    
    var controlIndex: Int {
        switch self {
        case .credit:
            return 0
        case .applepay:
            return 1
        case .cash:
            return 2
        }
    }
}
