//
//  AlertManager.swift
//  Wolfish
//
//  Created by Petre Vane on 27/11/2020.
//

import SwiftUI


struct AlertManager: Identifiable {
    let id = UUID()
    let title: Text
    let errorMessage: Text
    let button: Alert.Button
    
}
