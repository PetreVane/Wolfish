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
    @State private var presentDetailView = false
    @State private var mealItem: MealItem?
    
    init() { customNavigationBar() }
    
    var body: some View {
        ZStack {
            NavigationView {
                List(model.items) { meal in
                    ListCell(meal: meal)
                        .onTapGesture {
                            model.mealItem = meal
                        }
                }
                .navigationTitle("Snacks")
                .disabled(presentDetailView ? true : false)
                
            }
            .alert(item: $model.alert) { alert in
                Alert(title: alert.title, message: alert.errorMessage, dismissButton: alert.button)
            }
            .blur(radius: model.presentDetailView ? 10 : 0)
            
            if model.presentDetailView {
                DetailView(meal: model.mealItem!, isDetailViewPresented: $model.presentDetailView)
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

