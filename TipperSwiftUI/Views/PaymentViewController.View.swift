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
        @Binding var selectedTipPercentage: TipPercent
    }
}

extension PaymentViewController.View: UIViewControllerRepresentable {
    func makeCoordinator() -> PaymentViewControllerDelegate {
        PaymentViewController.Delegate(selectedTipPercentage: $selectedTipPercentage)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // nothing to do here
    }
    
    func makeUIViewController(context: Context) -> PaymentViewController {
        let paymentViewController = UIStoryboard(name: "PaymentViewController", bundle: nil).instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
        paymentViewController.delegate = context.coordinator
        paymentViewController.selectedTipPercentage = selectedTipPercentage
        return paymentViewController
    }
}

private extension PaymentViewController {
    final class Delegate {
        @Binding var selectedTipPercentage: TipPercent
        
        init(selectedTipPercentage: Binding<TipPercent>) {
            _selectedTipPercentage = selectedTipPercentage
        }
    }
}

extension PaymentViewController.Delegate: PaymentViewControllerDelegate {
    func paymentSelector(_ selector: PaymentViewController, didFinishSelecting payment: String) {
        print("payment method: \(payment) selected!")
    }
}
