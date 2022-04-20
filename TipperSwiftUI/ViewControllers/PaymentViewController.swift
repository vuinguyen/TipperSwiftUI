//
//  PaymentViewController.swift
//  TipperSwiftUI
//
//  Created by Vui Nguyen on 4/19/22.
//

import UIKit

protocol PaymentViewControllerDelegate {
    func paymentSelector(_ selector: PaymentViewController, didFinishSelecting payment: PaymentMethod)
}

class PaymentViewController: UIViewController {

    @IBOutlet weak var tipBasedImageView: UIImageView!
    @IBOutlet weak var paymentMethodSegementedControl: UISegmentedControl!
    
    var delegate: PaymentViewControllerDelegate?
    var selectedTipPercentage: TipPercent?
    var paymentMethodSelected: PaymentMethod = PaymentMethod.credit
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImage()
        configureSegmentedControl()
        paymentMethodSelectedChanged()
    }

    private func configureImage() {
        if let imageName = selectedTipPercentage?.image {
            tipBasedImageView.image = UIImage(named: imageName)
        }
    }
    
    private func configureSegmentedControl() {
        paymentMethodSegementedControl.addTarget(self, action: #selector(self.paymentMethodSelectedChanged), for: .valueChanged)
    }
    
    @objc func paymentMethodSelectedChanged() {
        switch paymentMethodSegementedControl.selectedSegmentIndex {
        case PaymentMethod.credit.controlIndex:
            paymentMethodSelected = PaymentMethod.credit
        case PaymentMethod.applepay.controlIndex:
            paymentMethodSelected = PaymentMethod.applepay
        case PaymentMethod.cash.controlIndex:
            paymentMethodSelected = PaymentMethod.cash
        default:
            paymentMethodSelected = PaymentMethod.credit
        }
        delegate?.paymentSelector(self, didFinishSelecting: paymentMethodSelected)
    }
    
}
