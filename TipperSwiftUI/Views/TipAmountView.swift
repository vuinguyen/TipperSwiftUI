//
//  TipAmountView.swift
//  TipperSwiftUI
//
//  Created by Vui Nguyen on 3/17/22.
//

import SwiftUI

// Note: This view is deprecated, but keeping it in this file for
// documentation. This view was used before it was refactored into
// the CalculatedAmountView.
// CalculatedAmountView now displays the tip amount AND the bill total views
struct TipAmountView: View {
    @Binding var selectedTipPercentage: TipPercent
    @Binding var billAmount: Float
    let viewModel: TipperViewModel

    var body: some View {
        HStack(alignment: .center) {
            Text("Tip Amount")
                .primaryStyle()
            Spacer(minLength: 100)
            Text(viewModel.getTipAmountStringFormatted(tipPercent: selectedTipPercentage, billAmount: billAmount))
                .font(.subheadline)
                .fontWeight(.regular)
            // Color in hex #323A56
                .foregroundColor(Color(red: 0.19607843137254902, green: 0.22745098039215686, blue: 0.33725490196078434))
            Spacer()
                .frame(width: 20)
        }
    }
}

// According to a StackOverflow post, we have to set up the binding variables
// into the preview this work for it to work:
// https://stackoverflow.com/a/60105482
struct TipAmountView_Previews: PreviewProvider {
    @State static var selectedTipPercentage = TipPercent.fifteen
    @State static var billAmount = Float(10.00)
    static var previews: some View {
        TipAmountView(selectedTipPercentage: $selectedTipPercentage, billAmount: $billAmount, viewModel: TipperViewModel())
    }
}
