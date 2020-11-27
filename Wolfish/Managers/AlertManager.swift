//
//  AlertManager.swift
//  Wolfish
//
//  Created by Petre Vane on 27/11/2020.
//

import SwiftUI


struct AlertManager: Identifiable {
    let id = UUID()
    let title: String
    let errorMessage: String
    let button: Alert.Button
    
}
