//
//  WAccountViewModel.swift
//  Wolfish
//
//  Created by Petre Vane on 08/12/2020.
//

import SwiftUI

class WAccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alert: AlertManager?
    
    var isFormValid: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.emailAddress.isEmpty else  { self.alert = presentAlert(.missingInput); return false }
        guard user.emailAddress.isValidEmail else {self.alert = presentAlert(.wrongFormattedEmailAddress); return false }
        return true
    }
    
    
    /// Saves user details to UserDefaults (AppStorage in swiftUI)
    func saveUserDetails() {
        let encoder = JSONEncoder()
        
        do {
            let encodedData = try encoder.encode(user)
            userData = encodedData
            self.alert = presentAlert(.successEncodingData)
            
        } catch {
            print("Errors while saving data to UserDefaults")
        }
    }
    
    /// Retrieves user details from UserDefaults (AppStorage in swiftUI)
    func retrieveUserDetails() {
        guard let userData = userData else { return }
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(User.self, from: userData)
            user = decodedData
            
        } catch {
            self.alert = presentAlert(.invalidJsonParsing)
        }
    }
    

    private func presentAlert(_ error: ErrorManager) -> AlertManager? {
        let alert = error.presentAlert
        return alert
    }
}
