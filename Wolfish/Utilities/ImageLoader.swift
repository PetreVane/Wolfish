//
//  ImageLoader.swift
//  Wolfish
//
//  Created by Petre Vane on 30/11/2020.
//

import SwiftUI


class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func loadImageFromURL(stringURL: String) {
        NetworkManager.sharedInstance.fetchImageFrom(stringURL: stringURL) { [self] (UIImage) in
            guard let image = UIImage else { return }
            DispatchQueue.main.async { self.image = Image(uiImage: image) }
        }
    }
    
}


struct RemoteImage: View {
    
    let image: Image?
    
    var body: some View {
        image?.resizable() ?? Images.placeholder.resizable()
    }
}


struct RemoteImageLoader: View {
    
    @StateObject var loader = ImageLoader()
    let imageURL: String
    
    var body: some View {
        RemoteImage(image: loader.image)
            .onAppear(perform: {
                loader.loadImageFromURL(stringURL: imageURL)
            }
        )
    }
}
