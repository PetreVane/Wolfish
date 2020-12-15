//
//  WTabView.swift
//  Wolfish
//
//  Created by Petre Vane on 26/11/2020.
//

import SwiftUI

struct WTabView: View {
    
    var body: some View {
        TabView {
            
            WListView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            WAccountView()
                .tabItem {
                    Image(systemName: "person.icloud.fill")
                    Text("Account")
                }
            
            WOrderView()
                .tabItem {
                    Image(systemName: "cart.badge.plus.fill")
                    Text("Order")
                }
        }.accentColor(Color("brandPrimary"))
    }
}

struct WTabView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WTabView()
        }
    }
}
