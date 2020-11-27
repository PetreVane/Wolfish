//
//  WListView.swift
//  Wolfish
//
//  Created by Petre Vane on 26/11/2020.
//

import SwiftUI
import UIKit

struct WListView: View {
    
    @StateObject var model = WolfishViewModel()
    init() { customNavigationBar() }
    
    var body: some View {
        NavigationView {
            List(model.items) { meal in
                ListCell(model: model, meal: meal)
            }.navigationTitle("Snacks")
        }
        .alert(item: $model.alert) { alert in
            Alert(title: alert.title, message: alert.errorMessage, dismissButton: alert.button)
        }
    }
}

struct ListCell: View {
    
    @ObservedObject var model: WolfishViewModel
    var meal: MealItem
    
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
        }.onAppear { model.fetchImages(forItem: meal.imageURL) }
    }
}

struct WListView_Previews: PreviewProvider {
    static var previews: some View {
        WListView()
    }
}
