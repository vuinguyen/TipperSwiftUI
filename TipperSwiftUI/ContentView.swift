//
//  ContentView.swift
//  TipperSwiftUI
//
//  Created by Vui Nguyen on 1/30/22.
//

import SwiftUI

struct ContentView: View {

    @State var billAmount: String = ""
    @State var selectedTipPercentage: TipPercent = .fifteen

    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Bill Amount")
                .primaryStyle()
            TextField("$153.01", value: $billAmount, formatter: formatter)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .foregroundColor(Color(red: 0.2627450980392157, green: 0.4588235294117647, blue: 0.8627450980392157))
                .font(.title2)
            Text("Tip Percent")
                .primaryStyle()
            Picker("What is your favorite color?", selection: $selectedTipPercentage) {
                ForEach(TipPercent.allCases) { percent in
                    Text(percent.description)
                }
            }
            .padding(.horizontal)
            .pickerStyle(.segmented)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
