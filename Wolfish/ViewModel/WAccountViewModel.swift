//
//  WAccountViewModel.swift
//  Wolfish
//
//  Created by Petre Vane on 08/12/2020.
//

import SwiftUI

class WAccountViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var emailAddress = ""
    @Published var birthDate = Date()
    @Published var extraNapkins = false
    @Published var frequentRefill = false
    @Published var alert: AlertManager?
    
    var isFormValid: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !emailAddress.isEmpty else  { return false }
        guard emailAddress.isValidEmail else { return false }
        
        return true
    }
    func printValues() {
        print("Your first name is \(firstName)")
        print("Your last name is \(lastName)")
        print("Your email is \(emailAddress)")
        print("Your birthdate name is \(birthDate)")
    }
}
