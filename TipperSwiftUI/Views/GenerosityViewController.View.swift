//
//  GenerosityView.swift
//  TipperSwiftUI
//
//  Created by Vui Nguyen on 4/14/22.
//

import SwiftUI
import UIKit


extension GenerosityViewController {
    struct View {
        @Binding var tipPercentage: TipPercent
    }
}

extension GenerosityViewController.View: UIViewControllerRepresentable {
   
    func makeCoordinator() -> some GenerosityViewControllerDelegate {
        GenerosityViewController.Delegate(tipPercentage: $tipPercentage)
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // nothing to do here
    }
    
    func makeUIViewController(context: Context) -> GenerosityViewController {
        let generosityViewController = UIStoryboard(name: "GenerosityView", bundle: nil).instantiateViewController(withIdentifier: "GenerosityViewController") as! GenerosityViewController
        generosityViewController.delegate = context.coordinator
        generosityViewController.tipPercentage = tipPercentage
        return generosityViewController
    }
    
}

extension GenerosityViewController.Delegate: GenerosityViewControllerDelegate {
    func imageSelector(_ selector: GenerosityViewController, didFinishSelecting image: String) {
        selector.generosityImageView.image = UIImage(named: image)
    }
}

private extension GenerosityViewController {
    final class Delegate {
        init(tipPercentage: Binding<TipPercent>) {
            _tipPercentage = tipPercentage
        }
        
        @Binding var tipPercentage: TipPercent
    }
}
