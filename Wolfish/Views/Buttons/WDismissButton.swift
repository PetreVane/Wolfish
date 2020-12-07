//
//  WDismissButton.swift
//  Wolfish
//
//  Created by Petre Vane on 07/12/2020.
//

import SwiftUI

struct WDismissButton: View {
    @Binding var isDetailViewPresented: Bool
    
    var body: some View {
        Button(action: {
            isDetailViewPresented = false
        }, label: {
            ZStack {
                Circle()
                    .frame(width: 33, height: 33)
                    .foregroundColor(Color(.secondaryLabel))
                
                Image(systemName: "xmark.circle.fill")
                    .frame(width: 50, height: 50)
                    .foregroundColor(Colors.primary)
            }
        })
    }
}

struct WButton_Previews: PreviewProvider {
    static var previews: some View {
        WDismissButton(isDetailViewPresented: .constant(false))
    }
}
