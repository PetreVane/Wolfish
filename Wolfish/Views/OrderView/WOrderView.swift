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
            .navigationTitle("Orders")
        }
    }
}

struct WOrderView_Previews: PreviewProvider {
    static var previews: some View {
        WOrderView()
    }
}
