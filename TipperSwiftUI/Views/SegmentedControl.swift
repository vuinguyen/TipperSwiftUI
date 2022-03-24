//
//  SegmentedControlView.swift
//  TipperSwiftUI
//
//  Created by Vui Nguyen on 3/23/22.
//

import SwiftUI

struct SegmentedControl: UIViewRepresentable {
    class Coordinator: NSObject {
        var segmentedControl: SegmentedControl
        
        init(_ segmentedControl: SegmentedControl) {
            self.segmentedControl = segmentedControl
        }
        
        @objc func tipPercentChanged(_ sender: UISegmentedControl) {
            switch sender.selectedSegmentIndex {
            case TipPercent.fifteen.controlIndex:
                segmentedControl.selectedTipPercentage = .fifteen
            case TipPercent.twenty.controlIndex:
                segmentedControl.selectedTipPercentage = .twenty
            case TipPercent.twentyfive.controlIndex:
                segmentedControl.selectedTipPercentage = .twentyfive
            default:
                segmentedControl.selectedTipPercentage = .fifteen
            }

            print("segment selected: \(segmentedControl.selectedTipPercentage.description)")
        }
    }
    
    @Binding var selectedTipPercentage: TipPercent
    
    func makeCoordinator() -> SegmentedControl.Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: UISegmentedControl, context: Context) {
        uiView.selectedSegmentIndex = selectedTipPercentage.controlIndex
    }
    
    func makeUIView(context: Context) -> UISegmentedControl {
        let control = UISegmentedControl(items: [TipPercent.fifteen.description, TipPercent.twenty.description, TipPercent.twentyfive.description])
        control.selectedSegmentIndex = selectedTipPercentage.controlIndex
        let clearColor = UIColor(red: 248.0/255.0, green: 248.0/255.0, blue: 248.0/255.0, alpha: 1.0)
        let blueColor = UIColor(red: 67.0/255.0, green: 117.0/255.0, blue: 220.0/255.0, alpha: 1.0)
        control.backgroundColor = clearColor
        control.selectedSegmentTintColor = blueColor
        control.addTarget(context.coordinator, action: #selector(Coordinator.tipPercentChanged(_:)), for: .valueChanged)
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
