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
        ZStack {
            NavigationView {
                List(model.items) { meal in
                    ListCell(meal: meal)
                }.navigationTitle("Snacks")
            }.alert(item: $model.alert) { alert in
                Alert(title: alert.title, message: alert.errorMessage, dismissButton: alert.button)
            }
            if model.isLoading {
                LoadingView()
            }
        }
    }
}

struct ListCell: View {
    
    var meal: MealItem
    @State private var remoteImage: Image? = nil
    
    var body: some View {
        HStack {
            RemoteImageLoader(imageURL: meal.imageURL)
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
