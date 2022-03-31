//
//  ContentView.swift
//  TipperSwiftUI
//
//  Created by Vui Nguyen on 1/30/22.
//

import SwiftUI

struct ContentView: View {

    @State var billAmount = Float(0.0)
    @State var selectedTipPercentage: TipPercent = .fifteen
    let viewModel = TipperViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Bill Amount")
                .primaryStyle()
            TextField("", value: $billAmount, formatter: viewModel.formatter)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
            // color in hex #4375DC
                .foregroundColor(Color(red: 0.2627450980392157, green: 0.4588235294117647, blue: 0.8627450980392157))
                .font(.title2)
            Text("Tip Percent")
                .primaryStyle()
            Picker("Select Tip Percentage", selection: $selectedTipPercentage) {
                ForEach(TipPercent.allCases) { percent in
                    Text(percent.description)
                }
            }
            .padding(.horizontal)
            .pickerStyle(.segmented)

            Spacer()
                .frame(height: 30)
            VStack {
                CalculatedAmountView(amountLabel: "Tip Amount",
                                     amount: viewModel.getTipAmountStringFormatted(tipPercent:
                                                                                    selectedTipPercentage,
                                                                                   billAmount:
                                                                                    billAmount))
                
                Divider()
                    .padding(.horizontal)
                
                CalculatedAmountView(amountLabel: "Bill Total",
                                     amount: viewModel.getBillTotalStringFormatted(tipPercent:
                                                                                    selectedTipPercentage,
                                                                                   billAmount:
                                                                                    billAmount))
            }
            // Color in hex #E4ECFA
            .background(Color(red: 0.8941176470588236, green: 0.9254901960784314, blue: 0.9803921568627451))
            // Add spacer to push the entire VStack view (above) to the top of the screen
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
