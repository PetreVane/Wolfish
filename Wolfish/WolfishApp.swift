//
//  WolfishApp.swift
//  Wolfish
//
//  Created by Petre Vane on 26/11/2020.
//

import SwiftUI

@main
struct WolfishApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            WTabView()
//            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
