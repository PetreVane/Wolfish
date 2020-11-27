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
    
    private init() {}
    
    func fetchItems(completion: @escaping (Result<[MealItem], ErrorManager>) -> Void) {
    
        guard let url = resourceURL else { completion(.failure(.invalidURL)); return }
    
        let session = URLSession.shared
        
        session.dataTask(with: url) {[weak self] (data, response, error) in
            
            guard self != nil else { return }
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
    
    func fetchImageFor(item itemURL: String, completion: @escaping (Result<UIImage, ErrorManager>) -> Void) {
        guard let url = URL(string:itemURL) else { completion(.failure(.invalidURL)); return }
        
        let session = URLSession.shared
        session.dataTask(with: url) {[weak self] (data, response, error) in
            
            guard self != nil else { return }
            guard error == nil else { completion(.failure(.unknownError)); return }
            guard let receivedResponse = response as? HTTPURLResponse,
                  receivedResponse.statusCode == 200 else { completion(.failure(.invalidNetworkResponse)); return }
            guard let receivedData = data else { completion(.failure(.invalidData)); return }
            guard let image = UIImage(data: receivedData) else { completion(.failure(.failedDecodingImage)); return }
            completion(.success(image))
            
        }.resume()
    }
}
