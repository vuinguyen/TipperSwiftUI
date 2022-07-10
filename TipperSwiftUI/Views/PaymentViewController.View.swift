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
        @Binding var payState: PayState
    }
}

extension PaymentViewController.View: UIViewControllerRepresentable {
    func makeCoordinator() -> PaymentViewControllerDelegate {
        PaymentViewController.Delegate(selectedTipPercentage: $selectedTipPercentage, paymentMethod: $paymentMethod, payState: $payState)
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
        @Binding var payState: PayState
        
        init(selectedTipPercentage: Binding<TipPercent>, paymentMethod: Binding<PaymentMethod?>, payState: Binding<PayState>) {
            _selectedTipPercentage = selectedTipPercentage
            _paymentMethod = paymentMethod
            _payState = payState
        }
    }
}

extension PaymentViewController.Delegate: PaymentViewControllerDelegate {
    func paymentSelector(_ selector: PaymentViewController, didFinishSelecting payment: PaymentMethod) {
        DispatchQueue.main.async { [self] in
            self.paymentMethod = payment
            self.payState = .paid
        }
    }
}
