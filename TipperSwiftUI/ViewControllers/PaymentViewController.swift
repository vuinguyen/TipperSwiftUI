//
//  PaymentViewController.swift
//  TipperSwiftUI
//
//  Created by Vui Nguyen on 4/19/22.
//

import UIKit

class PaymentViewController: UIViewController {

    @IBOutlet weak var tipBasedImageView: UIImageView!
    @IBOutlet weak var payMethodSegementedControl: UISegmentedControl!
    
    var selectedTipPercentage: TipPercent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImage()
    }

    private func configureImage() {
        if let imageName = selectedTipPercentage?.image {
            tipBasedImageView.image = UIImage(named: imageName)
        }
    }
}
