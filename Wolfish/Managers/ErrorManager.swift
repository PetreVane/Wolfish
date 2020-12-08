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
    case wrongFormattedEmailAddress
    case successEncodingData
    
    // this is for debugging purposses
    var description: String {
        switch self {
            case .invalidURL: return "The URL you provided is invalid"
            case .invalidNetworkResponse: return "Network responded with invalid Status code"
            case .invalidData: return "The received data object is corrupt"
            case .invalidJsonParsing: return "There is an error in your JSON decoding model"
            case .unknownError: return "Unknown error has occurred"
            case.failedDecodingImage: return "Image cannot be decoded from received data"
            case .missingInput: return "One of the Account input fields is missing some input"
            case .wrongFormattedEmailAddress: return " Your email address is not correct. Try again, please."
            default: return "Success saving user data in AppStorage"
        }
    }
    
    // this is for surfacing alerts
    var presentAlert: AlertManager {
        switch self {
            case .unknownError: return presentAlert(withMessage: "Are you sure you're connected to Internet?")
            case .invalidURL: return presentAlert(withMessage: "There is something wrong with the URL where Meals are hosted")
            case .invalidNetworkResponse: return presentAlert(withMessage: "There might be something wrong with the remote server, where Meals are hosted")
            case .invalidJsonParsing: return presentAlert(withMessage: "An error has occured while trying to retrieve your data. Try again later.")
            case .invalidData: return presentAlert(withMessage: "A hacker has intercepted and currupted our Data! Unbelievable!")
            case .missingInput: return presentAlert(withMessage: "Make sure you add your full name, email address and birth date. These details are required for ordering purposes")
            case .wrongFormattedEmailAddress: return presentAlert(withMessage: "Your email address does not appear to be correct. Try again, please.")
            case .successEncodingData: return presentInfo(withMessage: "Your details have been successfully saved on your phone 👍")
            default: return presentAlert(withMessage: "This is an error and you can do Nothing about it. So, get used with it!")
        }
    }
    
    private func presentAlert(withMessage message: String) -> AlertManager {
        let alert = AlertManager(title: Text("What, an error??"), errorMessage: Text(message), button: .default(Text("Dismiss")))
        return alert
    }
    
    private func presentInfo(withMessage message: String) -> AlertManager {
        let alert = AlertManager(title: Text("Success"), errorMessage: Text(message), button: .default(Text("I'm fine with that")))
        return alert
    }
}
