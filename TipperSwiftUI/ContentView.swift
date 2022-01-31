//
//  ContentView.swift
//  TipperSwiftUI
//
//  Created by Vui Nguyen on 1/30/22.
//

import SwiftUI

struct ContentView: View {

    @State var billAmount: String = ""

    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Bill Amount")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 0.19607843137254902, green: 0.22745098039215686, blue: 0.33725490196078434))
                .padding()
            TextField("$153.01", value: $billAmount, formatter: formatter)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .foregroundColor(Color(red: 0.2627450980392157, green: 0.4588235294117647, blue: 0.8627450980392157))
                .font(.title2)
            Text("Tip Percent")
                .font(.headline)
                .fontWeight(.semibold)
                .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
