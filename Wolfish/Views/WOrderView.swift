//
//  WOrderView.swift
//  Wolfish
//
//  Created by Petre Vane on 26/11/2020.
//

import SwiftUI

struct WOrderView: View {
    
    init() { customNavigationBar() }
    
    
    var body: some View {
        NavigationView {
            Text("Order View" )
                .navigationTitle("Orders")
        }
        
    }
}

struct WOrderView_Previews: PreviewProvider {
    static var previews: some View {
        WOrderView()
    }
}
