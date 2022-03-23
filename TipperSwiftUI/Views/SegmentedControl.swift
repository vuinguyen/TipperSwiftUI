//
//  SegmentedControlView.swift
//  TipperSwiftUI
//
//  Created by Vui Nguyen on 3/23/22.
//

import SwiftUI

struct SegmentedControl: UIViewRepresentable {
    func updateUIView(_ uiView: UISegmentedControl, context: Context) {
        // stuff
    }
    
    func makeUIView(context: Context) -> UISegmentedControl {
        let control = UISegmentedControl(items: [TipPercent.fifteen.description, TipPercent.twenty.description, TipPercent.twentyfive.description])
        control.selectedSegmentIndex = TipPercent.fifteen.controlIndex
        return control
    }
}


struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControl()
            .previewLayout(.sizeThatFits)
    }
}
