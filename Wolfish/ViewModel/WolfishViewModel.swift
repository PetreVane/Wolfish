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
    @Published var alert: AlertManager?
    @Published var images = [Image]()
    
    init() { self.items = fetchItems() }
    
    
    func fetchItems() -> [MealItem] {
        networkManager.fetchItems() { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .failure(let error): DispatchQueue.main.async { self.alert = error.presentAlert }
                case .success(let items): DispatchQueue.main.async { self.items = items }
            }
        }
        return items
    }
    
    func fetchImages() {
//        networkManager.fetchImageFor(item: <#T##String#>, completion: <#T##(Result<UIImage, ErrorManager>) -> Void#>)
    }
}
