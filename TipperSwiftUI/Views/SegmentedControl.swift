//
//  SegmentedControlView.swift
//  TipperSwiftUI
//
//  Created by Vui Nguyen on 3/23/22.
//

import SwiftUI

struct SegmentedControl: UIViewRepresentable {
    @Binding var selectedTipPercentage: TipPercent
    
    func updateUIView(_ uiView: UISegmentedControl, context: Context) {
        // stuff
    }
    
    func makeUIView(context: Context) -> UISegmentedControl {
        let control = UISegmentedControl(items: [TipPercent.fifteen.description, TipPercent.twenty.description, TipPercent.twentyfive.description])
        control.selectedSegmentIndex = selectedTipPercentage.controlIndex
        let clearColor = UIColor(red: 248.0/255.0, green: 248.0/255.0, blue: 248.0/255.0, alpha: 1.0)
        let blueColor = UIColor(red: 67.0/255.0, green: 117.0/255.0, blue: 220.0/255.0, alpha: 1.0)
        control.backgroundColor = clearColor
        control.selectedSegmentTintColor = blueColor
        return control
    }
}


struct SegmentedControlView_Previews: PreviewProvider {
    @State static var selectedTipPercentage = TipPercent.fifteen
    static var previews: some View {
        SegmentedControl(selectedTipPercentage: $selectedTipPercentage)
            .previewLayout(.sizeThatFits)
    }
}
