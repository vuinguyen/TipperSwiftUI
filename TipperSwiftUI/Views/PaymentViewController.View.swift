//
//  PaymentViewController.View.swift
//  TipperSwiftUI
//
//  Created by Vui Nguyen on 4/19/22.
//

import SwiftUI
import UIKit

extension PaymentViewController {
    struct View {
        
    }
}

extension PaymentViewController.View: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> PaymentViewController {
        let paymentViewController = UIStoryboard(name: "PaymentViewController", bundle: nil).instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
        return paymentViewController
    }
    
    
}
