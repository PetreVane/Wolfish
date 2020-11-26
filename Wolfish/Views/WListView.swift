//
//  WListView.swift
//  Wolfish
//
//  Created by Petre Vane on 26/11/2020.
//

import SwiftUI
import UIKit

struct WListView: View {
    
    init() { customNavigationBar() }
    
    var body: some View {
        NavigationView {
            Text("List View")
                .navigationTitle("Snacks")
        }
        
    }
}

struct WListView_Previews: PreviewProvider {
    static var previews: some View {
        WListView()
    }
}
