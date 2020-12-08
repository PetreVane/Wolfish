//
//  ErrorManager.swift
//  Wolfish
//
//  Created by Petre Vane on 27/11/2020.
//

import Foundation
import SwiftUI

enum ErrorManager: Error {
    case unknownError
    case invalidURL
    case invalidNetworkResponse
    case invalidData
    case invalidJsonParsing
    case failedDecodingImage
    case missingInput
    
    var description: String {
        switch self {
            case .invalidURL: return "The URL you provided is invalid"
            case .invalidNetworkResponse: return "Network responded with invalid Status code"
            case .invalidData: return "The received data object is corrupt"
            case .invalidJsonParsing: return "There is an error in your JSON decoding model"
            case .unknownError: return "Unknown error has occurred"
            case.failedDecodingImage: return "Image cannot be decoded from received data"
            case .missingInput: return "One of the Account input fields is missing some input"
        }
    }
    
    var presentAlert: AlertManager {
        switch self {
            case .unknownError: return presentAlert(withMessage: "Are you sure you're connected to Internet?")
            case .invalidURL: return presentAlert(withMessage: "There is something wrong with the URL where Meals are hosted")
            case .invalidNetworkResponse: return presentAlert(withMessage: "There might be something wrong with the remote server, where Meals are hosted")
            case .invalidJsonParsing: return presentAlert(withMessage: "You shouldn't see this Error popping out. There is nothing you can do about it")
            case.invalidData: return presentAlert(withMessage: "A hacker has intercepted and currupted our Data! Unbelievable!")
            case .missingInput: return presentAlert(withMessage: "Make sure you add your full name, email address and birth date. These details are required for ordering purposes")
            default: return presentAlert(withMessage: "This is an error and you can do Nothing about it. So, get used with it!")
        }
    }
    
    private func presentAlert(withMessage message: String) -> AlertManager {
        let alert = AlertManager(title: Text("Whaaat?! An error??"), errorMessage: Text(message), button: .default(Text("Dismiss")))
        return alert
    }
}
