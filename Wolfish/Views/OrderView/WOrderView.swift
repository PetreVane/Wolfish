//
//  WOrderView.swift
//  Wolfish
//
//  Created by Petre Vane on 26/11/2020.
//

import SwiftUI

struct WOrderView: View {
    
    init() { customNavigationBar() }
    @EnvironmentObject var order: OrderDataFlow
    
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.mealItems) { mealItem in
                            ListCell(meal: mealItem)
                        }
                        .onDelete(perform: { indexSet in
                            order.removeItem(indexSet)})
                    }.listStyle(InsetGroupedListStyle())
          
                    WButtonDesign(price: "Total £: \(order.totalPrice, specifier: "%.1f") - Place order").padding(.bottom, 25)
                }
                
                if order.mealItems.isEmpty {
                    EmptyState(imageName: Images.emptyOrder, textMessage: "Your order list is empty. Order some meals and they will show up here.")
                }
                
            }.navigationTitle("Orders")
   
        }
    }
}

struct WOrderView_Previews: PreviewProvider {
    static var previews: some View {
        WOrderView()
    }
}

