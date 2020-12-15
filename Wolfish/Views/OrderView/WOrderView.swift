//
//  WOrderView.swift
//  Wolfish
//
//  Created by Petre Vane on 26/11/2020.
//

import SwiftUI

struct WOrderView: View {
    
    init() { customNavigationBar() }
    @State private var meals = MockData.meals
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(meals) { mealItem in
                            ListCell(meal: mealItem)
                        }
                        .onDelete(perform: { indexSet in
                            meals.remove(atOffsets: indexSet)
                        })
                    }.listStyle(InsetGroupedListStyle())
          
                    WOrderButton(price: "Place order").padding(.bottom, 25)
                }
                
                if meals.isEmpty {
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
