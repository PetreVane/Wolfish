//
//  WolfishViewModel.swift
//  Wolfish
//
//  Created by Petre Vane on 27/11/2020.
//

import SwiftUI
import UIKit


final class WolfishViewModel: ObservableObject {
    
    @ObservedObject var networkManager = NetworkManager.sharedInstance
    @Published var items = [MealItem]()
    @Published var alert: AlertManager?
    @Published var images: Dictionary<String, UIImage> = [:]
    
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
    
    func fetchImages(forItem itemURL: String) {
        networkManager.fetchImageFor(item: itemURL) { [self] result in
            switch result {
                case .failure(let error): DispatchQueue.main.async { self.alert = error.presentAlert }
            case .success(let image): DispatchQueue.main.async { self.images.updateValue(image, forKey: itemURL) }
            }
        }
    }
    
    func showImage(forItem item: MealItem) -> UIImage? {
        let imageURL = item.imageURL
        var returnedImage: UIImage?
        if let image = self.images[imageURL] { returnedImage = image }
        return returnedImage
    }
}
