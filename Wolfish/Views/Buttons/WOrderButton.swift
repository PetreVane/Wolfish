//
//  WOrderButton.swift
//  Wolfish
//
//  Created by Petre Vane on 07/12/2020.
//

import SwiftUI

struct WOrderButton: View {
    var price: LocalizedStringKey
    
    var body: some View {
        Button(action: {
            print("Button pressed")
            
        }, label: {
            Text(price)
                .fontWeight(.semibold)
                .frame(width: 300, height: 50, alignment: .center)
                .background(Colors.primary)
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(radius: 10)
        })
    }
}

struct WOrderButton_Previews: PreviewProvider {
    static var previews: some View {
        WOrderButton(price: "Testing")
    }
}

//  Text("£ \(price, specifier: "%.1f") - Add to basket ")
