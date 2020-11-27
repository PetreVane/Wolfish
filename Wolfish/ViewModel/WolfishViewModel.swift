//
//  WolfishViewModel.swift
//  Wolfish
//
//  Created by Petre Vane on 27/11/2020.
//

import SwiftUI


final class WolfishViewModel: ObservableObject {
    
    @ObservedObject var networkManager = NetworkManager.sharedInstance
    @Published var items = [MealItem]()
    
    init() {
        self.items = fetchItems()
    }
    
    
    func fetchItems() -> [MealItem] {
        networkManager.getItems()
        let items = networkManager.items
        print("Network manager informs that published items has \(items.count) objects so far")
        return items
    }
    
}
