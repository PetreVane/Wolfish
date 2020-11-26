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
            List(MockData.meals) { meal in
                ListCell(meal: meal)
            }.navigationTitle("Snacks")
        }
        
    }
}

struct ListCell: View {
    
    var meal: MealDescription
    
    var body: some View {
        HStack {
            Image("asian-flank-steak")
                .resizable()
                .frame(width: 125, height: 100, alignment: .center)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(meal.name).font(.title2)
                Text("£ \(meal.price, specifier: "%.1f")")
                    .foregroundColor(.secondary).fontWeight(.semibold)
            }.padding(.leading)
        }
    }
}

struct WListView_Previews: PreviewProvider {
    static var previews: some View {
        WListView()
    }
}
