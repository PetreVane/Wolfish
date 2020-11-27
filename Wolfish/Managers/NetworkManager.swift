//
//  NetworkManager.swift
//  Wolfish
//
//  Created by Petre Vane on 27/11/2020.
//

import UIKit


class NetworkManager: ObservableObject {
    
    static let sharedInstance = NetworkManager()
    private let resourceURL = URL(string: "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers")
    @Published var items = [MealItem]()
    
    private init() {}
    
    func getItems() {
        print("Get items called")
        let session = URLSession.shared
        
        session.dataTask(with: resourceURL!) {[weak self] (data, response, error) in
            
            guard let self = self else { return }
            guard error == nil else { return }
            guard let receivedData = data else { return }
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(Meal.self, from: receivedData)
                self.items = decodedData.request
                let mealExample = decodedData.request[0].name
                print("Your meal is called \(mealExample)")
                print("Published items has \(self.items.count) objects in it")
                
            } catch (let error){
                print("Network manager error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
