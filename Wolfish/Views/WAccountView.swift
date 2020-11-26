//
//  WAccountView.swift
//  Wolfish
//
//  Created by Petre Vane on 26/11/2020.
//

import SwiftUI

struct WAccountView: View {
    
    init() { customNavigationBar() }
    
    var body: some View {
        NavigationView {
            Text("Account View!")
                .navigationTitle("Account")
        }
    }
}

struct WAccountView_Previews: PreviewProvider {
    static var previews: some View {
        WAccountView()
    }
}
