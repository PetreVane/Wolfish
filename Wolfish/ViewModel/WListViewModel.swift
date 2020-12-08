//
//  WListViewModel.swift
//  Wolfish
//
//  Created by Petre Vane on 27/11/2020.
//

import SwiftUI
import UIKit


final class WListViewModel: ObservableObject {
    
    @ObservedObject var networkManager = NetworkManager.sharedInstance
    @Published var items = [MealItem]()
    @Published var alert: AlertManager?
    @Published var mealItem: MealItem? {
        didSet {
            presentDetailView = true
        }
    }
    
    @Published var isLoading: Bool = false
    @Published var presentDetailView: Bool = false
    init() { self.items = fetchItems() }
    
    
    func fetchItems() -> [MealItem] {
        isLoading = true
        networkManager.fetchItems() { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                    case .failure(let error): self.alert = error.presentAlert;
                    case .success(let items):  self.items = items;
                }
            }
        }
        return items
    }
    
}
