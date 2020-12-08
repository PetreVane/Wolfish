//
//  NetworkManager.swift
//  Wolfish
//
//  Created by Petre Vane on 27/11/2020.
//

import UIKit


final class NetworkManager: ObservableObject {
    
    static let sharedInstance = NetworkManager()
    private let resourceURL = URL(string: "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers")
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func fetchItems(completion: @escaping (Result<[MealItem], ErrorManager>) -> Void) {
    
        guard let url = resourceURL else { completion(.failure(.invalidURL)); return }
    
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else { completion(.failure(.unknownError)); return }
            guard let receivedResponse = response as? HTTPURLResponse,
                  receivedResponse.statusCode == 200 else { completion(.failure(.invalidNetworkResponse)); return }
            guard let receivedData = data else { completion(.failure(.invalidData)); return }
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(Meal.self, from: receivedData)
                completion(.success(decodedData.request))
                
            } catch { completion(.failure(.invalidJsonParsing))}
        }.resume()
    }
    
    func fetchImageFrom(stringURL: String, completion: @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: stringURL) else { completion(nil); return }
        let cacheKey = NSString(string: stringURL)
        
        if let cachedImage = cache.object(forKey: cacheKey) {
            completion(cachedImage)
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: url) {[self] (data, response, error) in
            
            guard let receivedData = data else { completion(nil); return }
            guard let networkImage = UIImage(data: receivedData) else { completion(nil); return }
            self.cache.setObject(networkImage, forKey: cacheKey)
            completion(networkImage)
            
        }.resume()
    }
}
