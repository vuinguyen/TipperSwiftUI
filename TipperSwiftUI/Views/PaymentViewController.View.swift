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
        @Binding var paymentMethod: PaymentMethod?
    }
}

extension PaymentViewController.View: UIViewControllerRepresentable {
    func makeCoordinator() -> PaymentViewControllerDelegate {
        PaymentViewController.Delegate(selectedTipPercentage: $selectedTipPercentage, paymentMethod: $paymentMethod)
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
        @Binding var paymentMethod: PaymentMethod?
        
        init(selectedTipPercentage: Binding<TipPercent>, paymentMethod: Binding<PaymentMethod?>) {
            _selectedTipPercentage = selectedTipPercentage
            _paymentMethod = paymentMethod
        }
    }
}

extension PaymentViewController.Delegate: PaymentViewControllerDelegate {
    func paymentSelector(_ selector: PaymentViewController, didFinishSelecting payment: PaymentMethod) {
        print("payment method: \(payment.description) selected!")
        DispatchQueue.main.async {
            self.paymentMethod = payment
        }
    }
}
