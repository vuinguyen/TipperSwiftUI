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
    let defaultBillAmount = Float(0.0)

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
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
                SegmentedControl(selectedTipPercentage: $selectedTipPercentage)
                    .padding(.horizontal)
                
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
                
                Spacer()
                    .frame(height: 30)
                
                NavigationLink(destination: PaymentViewController.View(selectedTipPercentage: $selectedTipPercentage)) {
                    Text("Pay")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                .disabled(billAmount > defaultBillAmount ? false : true)
                
                // Add spacer to push the entire VStack view (above) to the top of the screen
                Spacer()
                
            } // end top VStack
        }   // end NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
